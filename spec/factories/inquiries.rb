FactoryBot.define do
  factory :inquiry do
    name    { Faker::Name.name }
    email   { Faker::Internet.free_email }
    message { Faker::Lorem.sentence }
  end
end
