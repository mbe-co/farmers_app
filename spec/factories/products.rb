FactoryBot.define do
  factory :product do
    name { FFaker::Food.vegetable }
    category
  end
end
