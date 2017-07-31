class Story < ApplicationRecord
  extend FriendlyId
  include Concerns::Filterable

  has_many :jobs, dependent: :destroy

  validates :hn_id, presence: true, uniqueness: true
  validates :published_at, presence: true
  validates :title, presence: true, format: { with: /who is hiring/i }

  friendly_id :title, use: %i[slugged finders]

  scope :recent, -> { order(published_at: :desc) }
  scope :with_jobs, -> { joins(:jobs).group('stories.id') }
end
