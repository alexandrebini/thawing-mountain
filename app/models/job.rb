class Job < ApplicationRecord
  belongs_to :story

  validates :hn_id, presence: true, uniqueness: true
  validates :published_at, :text, :user, presence: true
end
