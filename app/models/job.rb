class Job < ApplicationRecord
  include Concerns::Filterable

  belongs_to :story

  validates :hn_id, presence: true, uniqueness: true
  validates :published_at, :text, :user, presence: true

  scope :recent, -> { order(published_at: :desc) }
end
