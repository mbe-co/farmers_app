FactoryBot.define do
  factory :category do
    name { FFaker::Food.ingredient }
  end
end