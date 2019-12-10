FactoryBot.define do
  factory :place do
    name { Faker::Lorem.unique.sentence(word_count: 3) }
  end
end
