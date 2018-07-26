FactoryBot.define do
  factory :user do
    nickname      Faker::Name.first_name
    email         Faker::Internet.email
    password      'passord'
    session_token '2736254372658328327364523'
  end

end