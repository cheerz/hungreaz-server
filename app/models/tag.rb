class Tag < ApplicationRecord

  has_many :place_tags
  has_many :places, through: :place_tags

end
