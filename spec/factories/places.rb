FactoryBot.define do
  factory :place do
    name             Faker::Company.name
    lng              Faker::Address.longitude
    lat              Faker::Address.latitude
    address          Faker::Address.street_address
    first_image_url  'https://robohash.org/random'
    second_image_url 'https://robohash.org/random'
    third_image_url  'https://robohash.org/random'
    fourth_image_url 'https://robohash.org/random'
    fifth_image_url  'https://robohash.org/random'
    place_category   PlaceCategory[:food]
  end

end