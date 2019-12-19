FactoryBot.define do
  factory :spot do
    association :owner, factory: :user
    place
    name { Faker::House.room }
    slug { "" }
  end
end
