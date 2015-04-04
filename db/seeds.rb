post = FactoryGirl.create(:post)
10.times { FactoryGirl.create(:comment, post: post) }