FactoryBot.define do
  factory :order do
    customer
    purchase_date { Date.current }
    due_date { Date.current + 3.days }
    price_products {}
    delivery_tax { 2.5 }
    total {}
  end
end
