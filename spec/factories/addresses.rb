FactoryBot.define do
  factory :address do
    street { FFaker::AddressBR.street }
    number { rand(1000) }
    city { FFaker::AddressBR.city }
    state { FFaker::AddressBR.state }
    zipcode { FFaker::AddressBR.zip_code }
  end
end
