# frozen_string_literal: true

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
require 'test_helper'

class LocaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
