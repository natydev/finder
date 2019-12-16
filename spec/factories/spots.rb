FactoryBot.define do
  factory :spot do
    place
    name { Faker::House.room }
    slug { "" }
  end
end
