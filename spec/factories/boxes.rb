FactoryBot.define do
  factory :box do
    association :spot
    association :owner, factory: :user
    summary { Faker::Lorem.unique.sentence }
    code { Faker::Lorem.unique.characters(number: 3).upcase }
    typology { BoxTypology.list.sample }

    trait :standalone do
      typology { BoxTypology::STANDALONE }
    end

    trait :cluster do
      typology { BoxTypology::CLUSTER }
    end
  end
end
