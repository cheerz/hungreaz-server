class Event < ApplicationRecord

  belongs_to :place

  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :start_at, :stop_at, presence: true
  validate :datetime_range

  scope :future, ->{ where('stop_at BETWEEN ? AND ?', Time.now, Time.now.end_of_day) }

  def datetime_range
    if start_at >= stop_at
      errors.add :start_at, I18n.t('validations.event.stop_at')
    end
  end

end
