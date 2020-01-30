# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    association :owner, factory: :user
    name { Faker::Lorem.unique.sentence(word_count: 3) }
  end
end
