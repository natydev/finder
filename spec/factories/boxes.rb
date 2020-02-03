# frozen_string_literal: true

FactoryBot.define do
  factory :box do
    transient do
      has_picture { false }
    end

    association :spot
    association :owner, factory: :user
    summary { Faker::Lorem.unique.sentence }
    code_prefix { ['a', 'b', 'x', 'm', 'r'].sample }
    issued_on { Faker::Date.between(from: 3.years.ago, to: Date.today) }
    typology { BoxTypology.list.sample }
    quantity { typology == BoxTypology::STANDALONE ? 1 : nil }
    free_ratio { typology == BoxTypology::CLUSTER ? [0, 25, 50, 75, 100].sample : nil }
    volume { [rand(0..300), nil].sample }
    using { Faker::Boolean.boolean(true_ratio: 0.2) }
    side { SpotSide.list.sample }
    picture_data { TestPicture.file_data if has_picture }

    trait :standalone do
      typology { BoxTypology::STANDALONE }
    end

    trait :cluster do
      typology { BoxTypology::CLUSTER }
    end
  end
end
