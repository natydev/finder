FactoryBot.define do
  factory :item do
    association :box, factory: :box_cluster
    summary { Faker::Lorem.unique.sentence }
  end
end
