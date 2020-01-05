FactoryBot.define do
  factory :tag do
    association :owner, factory: :user
    name       { Faker::Lorem.unique.sentence(word_count: 2) }
    color      { Faker::Color.hex_color }
    background { Faker::Color.hex_color }

    trait :no_style do
      color { nil }
      background { nil }
    end
  end
end
