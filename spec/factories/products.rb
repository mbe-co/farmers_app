FactoryBot.define do
  factory :product do
    name { FFaker::Food.vegetable }
    status { :active }
    category
  end
end