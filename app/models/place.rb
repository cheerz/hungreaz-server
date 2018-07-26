class Place < ApplicationRecord

  acts_as_mappable default_units: :kms

  belongs_to :user

  has_many :events

  validates :name, :lng, :lat, presence: true
  validates :name,             uniqueness: true
  validates :lng,              uniqueness: {scope: [:lat]}

end
