class Story < ApplicationRecord
  has_many :jobs, dependent: :destroy

  validates :hn_id, presence: true, uniqueness: true
  validates :published_at, presence: true
  validates :title, presence: true, format: { with: /who is hiring/i }
end
