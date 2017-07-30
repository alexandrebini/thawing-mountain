class StoryProcessJob < ApplicationJob
  extend Memoist
  queue_as :default

  attr_reader :hn_id

  def perform(hn_id)
    @hn_id = hn_id
    return unless response.success?
    return unless model.save
    comments_ids.each { |comment_id| JobProcessJob.perform_later(model.id, comment_id) }
  end

  private

  def response
    HackerNews.item(hn_id)
  end

  def model
    Story.where(hn_id: hn_id).first_or_initialize.tap do |model|
      model.title = title
      model.published_at = published_at
    end
  end

  def comments_ids
    return [] unless response.success?
    response.parsed_response['kids'].to_a
  end

  def title
    response.parsed_response['title']
  end

  def published_at
    Time.zone.at(response.parsed_response['time'])
  end

  memoize :response, :model, :comments_ids, :title, :published_at
end
