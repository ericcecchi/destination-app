# frozen_string_literal: true

# == Schema Information
#
# Table name: guides
#
#  id             :bigint           not null, primary key
#  description    :text
#  image_url      :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  destination_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_guides_on_destination_id  (destination_id)
#  index_guides_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (destination_id => places.id)
#  fk_rails_...  (user_id => users.id)
#
class Guide < ApplicationRecord
  belongs_to :destination, optional: false
  belongs_to :user, optional: false
  has_many :guide_recommendations, dependent: :destroy
  has_many :recommendations, through: :guide_recommendations
  validates :title, presence: true
  validates :description, presence: true
end
