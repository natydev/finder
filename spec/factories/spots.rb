FactoryBot.define do
  factory :spot do
    place
    name { Faker::House.unique.room }
    slug { "" }
  end
end
