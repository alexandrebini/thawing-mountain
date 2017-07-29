require 'rails_helper'

RSpec.describe UserFetcherJob, type: :job, vcr: true do
  subject(:job) { described_class.perform_later }
  let(:queue_adapter) { ActiveJob::Base.queue_adapter }

  describe '#perform' do
    it 'enqueue StoryProcessJob for each story_id fetched' do
      allow(job).to receive(:stories_ids).and_return([1, 2, 3])
      expect { job.perform }.to change(queue_adapter.enqueued_jobs, :size).by(3)
    end
  end

  describe '#stories_ids' do
    subject { job.send(:stories_ids) }

    context 'success response' do
      before { allow(job.send(:response)).to receive(:success?).and_return(true) }
      it { is_expected.to be_an_instance_of(Array) }
    end

    context 'errored response' do
      before { allow(job.send(:response)).to receive(:success?).and_return(false) }
      it { is_expected.to be_an_instance_of(Array) }
    end
  end
end
