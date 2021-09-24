class Place < ApplicationRecord
  has_many :recommendations
  belongs_to :locale
end
