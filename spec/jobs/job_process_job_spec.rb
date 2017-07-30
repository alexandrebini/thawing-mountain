require 'rails_helper'

RSpec.describe JobProcessJob, type: :job, vcr: true do
  let(:hn_id) { 14_763_485 }
  let(:story) { create(:story) }
  let(:queue_adapter) { ActiveJob::Base.queue_adapter }
  subject(:job) { described_class.perform_later(story.id, hn_id) }

  describe '#perform' do
    let(:model) { build(:job) }

    context 'invalid story' do
      subject { job.perform(nil, hn_id) }
      it { is_expected.to be_nil }
    end

    context 'invalid response' do
      subject { job.perform(story.id, hn_id) }
      before { allow(job).to receive(:response).and_return(OpenStruct.new(success?: false)) }
      it { is_expected.to be_nil }
    end

    context 'valid story and response' do
      subject { job.perform(story.id, hn_id) }

      before do
        allow(job).to receive(:response).and_return(OpenStruct.new(success?: true))
        allow(job).to receive(:model).and_return(model)
      end

      it 'persists the model' do
        expect { job.perform(story.id, hn_id) }.to change { model.persisted? }.from(false).to(true)
      end
    end
  end

  describe '#model' do
    subject { job.send(:model) }
    let(:model) { build(:job) }

    before do
      allow(job).to receive(:story).and_return(story)
      allow(job).to receive(:hn_id).and_return(model.hn_id)
      allow(job).to receive(:text).and_return(model.text)
      allow(job).to receive(:user).and_return(model.user)
      allow(job).to receive(:published_at).and_return(model.published_at)
    end
    its(:hn_id) { is_expected.to eql(model.hn_id) }
    its(:text) { is_expected.to eql(model.text) }
    its(:user) { is_expected.to eql(model.user) }
    its(:published_at) { is_expected.to eql(model.published_at) }
    its(:story_id) { is_expected.to eql(story.id) }
  end

  describe '#published_at' do
    subject { job.send(:published_at) }
    before { allow(job.send(:response)).to receive(:parsed_response).and_return('time' => 0) }
    it { is_expected.to be_a_kind_of(Time) }
  end
end
