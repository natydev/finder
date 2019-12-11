FactoryBot.define do
  factory :allowance do
    association :owner, factory: :user
    allowanceable { nil }
    association :user
    read { true }
    create { Faker::Boolean.boolean(true_ratio: 0.3) }
    update { Faker::Boolean.boolean(true_ratio: 0.5) }
    delete { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end
