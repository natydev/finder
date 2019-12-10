FactoryBot.define do
  factory :allowance do
    owner { nil }
    allowanceable { nil }
    user { nil }
    read { false }
    create { false }
    update { false }
    delete { false }
  end
end
