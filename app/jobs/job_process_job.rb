class JobProcessJob < ApplicationJob
  extend Memoist
  queue_as :default

  attr_reader :story_id, :hn_id

  def perform(story_id, hn_id)
    @story_id = story_id
    @hn_id = hn_id
    return if story.blank?
    return unless response.success?
    model.save
  end

  private

  def story
    Story.find_by(id: story_id)
  end

  def response
    HackerNews.item(hn_id)
  end

  def model
    Job.where(hn_id: hn_id).first_or_initialize.tap do |model|
      model.story = story
      model.user = user
      model.text = text
      model.published_at = published_at
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

  memoize :story, :response, :model, :user, :text, :published_at
end
