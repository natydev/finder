# frozen_string_literal: true

FactoryBot.define do
  factory :spot do
    association :owner, factory: :user
    place
    name { Faker::House.room }
    code { Faker::Lorem.unique.characters(number: 3).upcase }
  end
end
