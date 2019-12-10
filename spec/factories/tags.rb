FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.unique.sentence(word_count: 2) }
  end
end
