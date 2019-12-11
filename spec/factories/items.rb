FactoryBot.define do
  factory :item do
    association :box, factory: [:box, :cluster]
    summary { Faker::Lorem.unique.sentence }
  end
end
