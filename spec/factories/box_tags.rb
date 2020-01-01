FactoryBot.define do
  factory :box_tag do
    association :box
    association :tag
  end
end
