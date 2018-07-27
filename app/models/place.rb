class Place < ApplicationRecord

  DEFAULT_METER_DISTANCE = 500

  acts_as_mappable default_units: :kms

  belongs_to :user
  belongs_to :place_category

  has_many :events
  has_many :place_tags
  has_many :tags, through: :place_tags

  validates :name, :lng, :lat, :address, :place_category, presence: true
  validates :name, uniqueness: true
  validates :lng,  uniqueness: {scope: [:lat]}

  delegate :email,      to: :user,           prefix: true, allow_nil: true
  delegate :tag, :name, to: :place_category, prefix: true

  def self.within_distance meter_distance, position_values
    meter_distance    = meter_distance || DEFAULT_DISTANCE
    km_distance_param = meter_distance / 1000.0
    within km_distance_param, origin: position_values
  end

  def place_category_tag= tag_value
    self.place_category = PlaceCategory[tag_value]
  end

  def user_email= email_value
    self.user = User[email_value]
  end

end
