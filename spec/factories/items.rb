# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    transient do
      has_picture { false }
    end

    association :owner, factory: :user
    association :box, factory: %i[box cluster]
    summary { Faker::Lorem.unique.sentence }
    picture_data { TestPicture.file_data if has_picture }
  end
end
