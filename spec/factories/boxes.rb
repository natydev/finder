FactoryBot.define do
  factory :box do
    spot
    association :owner, factory: :user
    summary { Faker::Lorem.unique.sentence }
    code { Faker::Lorem.unique.characters(number: 3).upcase }
    typology { BoxTypology.list.sample }

    factory :box_standalone do
      typology { BoxTypology::STANDALONE }
    end

    factory :box_cluster do
      typology { BoxTypology::CLUSTER }
    end

  end
end
