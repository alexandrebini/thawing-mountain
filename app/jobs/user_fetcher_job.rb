class UserFetcherJob < ApplicationJob
  extend Memoist
  queue_as :default
  USERNAME = 'whoishiring'.freeze
  LIMIT = 10

  def perform
    return unless response.success?
    stories_ids.each { |story_id| StoryProcessJob.perform_later(story_id) }
  end

  private

  def response
    HackerNews.user(USERNAME)
  end

  def stories_ids
    return [] unless response.success?
    response.parsed_response['submitted'].first(LIMIT)
  end

  memoize :response, :stories_ids
end
