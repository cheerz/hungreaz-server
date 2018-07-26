FactoryBot.define do
  factory :event do
    start_at 1.hour.from_now
    stop_at  2.hour.from_now
    place    Place.all.sample
  end

end