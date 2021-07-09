FactoryBot.define do
  factory :customer do
    email { FFaker::Internet.email }
    name { FFaker::Name.first_name }
    password { '123456' }
  end
end
