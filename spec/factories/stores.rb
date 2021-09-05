FactoryBot.define do
  factory :store do
    name {Faker::Lorem.words}
    address {Faker::Address.city}
    postal_code {Faker::Address.street_address}
    telephone {Faker::PhoneNumber.cell_phone}
    url {Faker::Internet.url}
    closing_day {Faker::Lorem.sentence(word_count: 3)}
    business_hour {Faker::Number.within(range: 1..24)}
    fee {Faker::Number.within(range: 1..10000)}
    parking_car {Faker::Lorem.words}
    parking_bicycle {Faker::Lorem.words}
    towel_rental {Faker::Lorem.words}
    water {Faker::Number.within(range: 1..100)}
    water_depth {Faker::Number.within(range: 1..100)}
    water_quality {Faker::Lorem.words}
    temperature {Faker::Number.within(range: 1..100)}
    roryu_status {Faker::Lorem.words}
    roryu_time {Faker::Number.within(range: 1..24)}
    air_bath {Faker::Lorem.words}
    break_place {Faker::Lorem.words}
    television {Faker::Lorem.words}
    bgm {Faker::Lorem.words}
    association :user
  end
end
