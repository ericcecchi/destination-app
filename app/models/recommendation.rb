class Recommendation < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :place, required: false

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
end
