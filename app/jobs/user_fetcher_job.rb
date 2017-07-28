class UserFetcherJob < ApplicationJob
  extend Memoist
  queue_as :default
  USERNAME = 'whoishiring'.freeze

  def perform
    return unless response.success?
    return if stories_ids.blank?
    stories_ids.each { |story_id| StoryProcessJob.perform_later(story_id) }
  end

  private

  def response
    HackerNews.user(USERNAME)
  end

  def stories_ids
    return unless response.success?
    response.parsed_response['submitted']
  end

  memoize :response, :stories_ids
end
