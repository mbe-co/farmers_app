FactoryBot.define do
  factory :order_product do
    order
    product
    quantity { 1 } 
    price { 5.5 } 
  end
end