FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.paragraph
    post { create(:post) }
  end
end
