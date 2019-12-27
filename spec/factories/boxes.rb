FactoryBot.define do
  factory :box do

    transient do
      has_picture { false }
    end

    association :spot
    association :owner, factory: :user
    summary { Faker::Lorem.unique.sentence }
    code { Faker::Lorem.unique.characters(number: 3).upcase }
    typology { BoxTypology.list.sample }
    quantity { (typology == BoxTypology::STANDALONE) ? 1 : nil }
    picture_data { TestPicture.file_data if has_picture }

    trait :standalone do
      typology { BoxTypology::STANDALONE }
    end

    trait :cluster do
      typology { BoxTypology::CLUSTER }
    end
  end
end
