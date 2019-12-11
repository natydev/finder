FactoryBot.define do
  factory :item_tag do
    association :item
    association :tag
  end
end
