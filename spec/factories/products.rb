FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "product#{n}" }
    category
  end
end
