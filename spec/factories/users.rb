FactoryBot.define do
  factory :user do
    name { 'name' }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
