class Micropost < ApplicationRecord
  belongs_to :user
  scope :micropost, -> { where(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
