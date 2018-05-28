FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@email.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
