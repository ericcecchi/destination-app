# == Schema Information
#
# Table name: recommendations
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#  user_id    :integer          not null
#
# Indexes
#
#  index_recommendations_on_place_id                (place_id)
#  index_recommendations_on_user_id                 (user_id)
#  index_recommendations_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  place_id  (place_id => places.id)
#  user_id   (user_id => users.id)
#
class Recommendation < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :place, required: false

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
end
