# frozen_string_literal: true

FactoryBot.define do
  factory :box_tag do
    association :box
    association :tag
  end
end
