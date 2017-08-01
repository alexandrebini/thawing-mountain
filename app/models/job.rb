class Job < ApplicationRecord
  include Concerns::Filterable
  include AlgoliaSearch

  belongs_to :story

  validates :hn_id, presence: true, uniqueness: true
  validates :published_at, :text, :user, presence: true

  scope :story_slug, lambda { |slug|
    joins(:story).where(stories: { slug: slug }).group('jobs.id')
  }
  scope :recent, -> { order(published_at: :desc) }

  algoliasearch per_environment: true, disable_indexing: !Rails.env.production? do
    attribute :story_id
    attribute :user
    attribute :text
    attribute :published_at do
      published_at.to_i
    end
    searchableAttributes ['text']
    customRanking ['desc(published_at)']
  end
end
