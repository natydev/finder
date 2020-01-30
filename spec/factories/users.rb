# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.safe_email }
    password { Faker::Internet.unique.password }
  end
end
