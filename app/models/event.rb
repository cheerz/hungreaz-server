class Event < ApplicationRecord

  belongs_to :place

  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :start_at, :stop_at, presence: true
  validate :datetime_range
  validate :overlap_events

  scope :future, ->{ where('stop_at BETWEEN ? AND ?', Time.now, Time.now.end_of_day) }

  def datetime_range
    if start_at >= stop_at
      errors.add :base, I18n.t('validations.event.stop_at')
    end
  end

  def overlap_events
    # (StartA <= EndB) and (EndA >= StartB) https://stackoverflow.com/a/325964
    if place.events.future.where('start_at <= ? AND stop_at >= ?', stop_at, start_at).any?
      errors.add :base, I18n.t('validations.event.overlap')
    end
  end

end
