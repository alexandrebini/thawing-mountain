class JobProcessJob < ApplicationJob
  extend Memoist
  queue_as :default

  attr_reader :hn_id

  def perform(hn_id)
    @hn_id = hn_id
    return unless response.success?
    job.save
  end

  private

  def response
    HackerNews.item(hn_id)
  end

  def job
    Job.where(hn_id: hn_id).first_or_initialize.tap do |job|
      job.user = user
      job.text = text
      job.published_at = published_at
    end
  end

  def user
    response.parsed_response['by']
  end

  def text
    response.parsed_response['text']
  end

  def published_at
    Time.zone.at(response.parsed_response['time'])
  end

  memoize :response, :job, :user, :text, :published_at
end
