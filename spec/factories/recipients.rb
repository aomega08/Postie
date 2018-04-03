FactoryBot.define do
  factory :recipient do
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end
