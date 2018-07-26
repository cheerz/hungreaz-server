class PlaceCategory < ApplicationRecord

  include Extendable

  indexable :tag

  has_many :places

  validates :name, :tag, uniqueness: true

end
