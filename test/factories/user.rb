FactoryGirl.define do
  factory :user do
    name 'John Smith'
    sequence(:email) { |n| "john-#{n}@example.com" }
    password 'q1w2e3r4'
    password_confirmation 'q1w2e3r4'
  end
end
