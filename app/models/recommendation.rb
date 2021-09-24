class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user_id, presence: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
end
