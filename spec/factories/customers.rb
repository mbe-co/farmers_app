FactoryBot.define do
  factory :customer do
    email { FFaker::Internet.email }
    name { FFaker::Name.first_name }
    password { '123456' }
  end

  trait :with_address do
    after(:create) do |customer|
      customer.address = FactoryBot.create(:address)
    end
  end
end
