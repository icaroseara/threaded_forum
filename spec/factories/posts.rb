FactoryGirl.define do
  factory :post do
    subject Faker::Lorem.sentence
  end
end
