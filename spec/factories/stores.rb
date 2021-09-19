FactoryBot.define do
  factory :store do
    name { Faker::Lorem.word }
    address { Faker::Address.city }
    postal_code { Faker::Address.street_address }
    telephone { Faker::PhoneNumber.cell_phone }
    url { Faker::Internet.url }
    closing_day { Faker::Lorem.word }
    business_hour { Faker::Number.within(range: 1..24) }
    fee { Faker::Number.within(range: 1..10_000) }
    parking_car { Faker::Lorem.word }
    parking_bicycle { Faker::Lorem.word }
    towel_rental { Faker::Lorem.word }
    water { Faker::Number.within(range: 1..100) }
    water_depth { Faker::Number.within(range: 1..100) }
    water_quality { Faker::Lorem.word }
    temperature { Faker::Number.within(range: 1..100) }
    roryu_status { Faker::Lorem.word }
    roryu_time { Faker::Number.within(range: 1..24) }
    air_bath { Faker::Lorem.word }
    break_place { Faker::Lorem.word }
    television { Faker::Lorem.word }
    bgm { Faker::Lorem.word }
    association :user
  end
end
