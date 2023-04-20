FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    measurement_unit { %w[kg g ml cl].sample }
    price { rand(100..1000) }
    quantity { rand(1..10) }
    user { association :user }
  end
end
