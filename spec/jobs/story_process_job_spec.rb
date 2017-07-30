require 'rails_helper'

RSpec.describe StoryProcessJob, type: :job, vcr: true do
  let(:hn_id) { 14_688_686 }
  let(:queue_adapter) { ActiveJob::Base.queue_adapter }
  subject(:job) { described_class.perform_later(hn_id) }

  describe '#perform' do
    context 'invalid response' do
      subject { job.perform(hn_id) }
      before { allow(job).to receive(:response).and_return(OpenStruct.new(success?: false)) }
      it { is_expected.to be_nil }
    end

    context 'invalid model' do
      subject { job.perform(hn_id) }
      before do
        allow(job).to receive(:response).and_return(OpenStruct.new(success?: true))
        allow(job).to receive(:model).and_return(OpenStruct.new(save: false))
      end
      it { is_expected.to be_nil }
    end

    context 'valid response and story' do
      subject { job.perform(hn_id) }
      let(:model) { build(:story) }

      before do
        allow(job).to receive(:comments_ids).and_return([1, 2, 3])
        allow(job).to receive(:response).and_return(OpenStruct.new(success?: true))
        allow(job).to receive(:model).and_return(model)
      end

      it 'persists the model' do
        expect { job.perform(hn_id) }.to change { model.persisted? }.from(false).to(true)
      end

      it 'enqueue JobProcessJob for each comments_id fetched' do
        expect { job.perform(hn_id) }.to change(queue_adapter.enqueued_jobs, :size).by(3)
      end
    end
  end

  describe '#model' do
    subject { job.send(:model) }
    let(:model) { build(:story) }
    before do
      allow(job).to receive(:hn_id).and_return(model.hn_id)
      allow(job).to receive(:title).and_return(model.title)
      allow(job).to receive(:published_at).and_return(model.published_at)
    end
    its(:hn_id) { is_expected.to eql(model.hn_id) }
    its(:title) { is_expected.to eql(model.title) }
    its(:published_at) { is_expected.to eql(model.published_at) }
  end

  describe '#comments_ids' do
    subject { job.send(:comments_ids) }

    context 'success response' do
      before { allow(job.send(:response)).to receive(:success?).and_return(true) }
      it { is_expected.to be_an_instance_of(Array) }
    end

    context 'errored response' do
      before { allow(job.send(:response)).to receive(:success?).and_return(false) }
      it { is_expected.to be_an_instance_of(Array) }
    end
  end

  describe '#published_at' do
    subject { job.send(:published_at) }
    before { allow(job.send(:response)).to receive(:parsed_response).and_return('time' => 0) }
    it { is_expected.to be_a_kind_of(Time) }
  end
end
