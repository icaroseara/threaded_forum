FactoryGirl.define do
  factory :post do
    subject Faker::Lorem.sentence
    
    factory :post_with_comments do
      transient do
        comments_count 15
      end
      
      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
      end
    end
  end
end
