FactoryBot.define do
  factory :address do
    street { FFaker::AddressBR.street }
    number { rand(1000) }
    neighborhood { FFaker::AddressBR.neighborhood }
    city { FFaker::AddressBR.city }
    state { FFaker::AddressBR.state }
    zipcode { FFaker::AddressBR.zip_code }
    customer
  end
end
