FactoryBot.define do
  factory :tag do
    association :owner, factory: :user
    name { Faker::Lorem.unique.sentence(word_count: 2) }
  end
end
