# == Schema Information
#
# Table name: locales
#
#  id             :integer          not null, primary key
#  content        :string
#  hero_image_url :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Locale < ApplicationRecord
  has_many :places
end
