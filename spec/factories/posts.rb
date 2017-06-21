FactoryGirl.define do
  factory :post do
    title Faker::GameOfThrones.character
    body Faker::Lorem.paragraph
  end
end
