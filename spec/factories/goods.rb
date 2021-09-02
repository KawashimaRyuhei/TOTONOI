FactoryBot.define do
  factory :good do
    association :store
    association :user
  end
end
