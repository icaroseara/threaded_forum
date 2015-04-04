require "spec_helper"

feature 'Create pagination' do
  let(:subject) { Faker::Lorem.sentence }
  let(:comment) { Faker::Lorem.paragraph }
  let(:new_comment) { Faker::Lorem.paragraph }
    
  background do
    visit root_path
    all(".posts").first.click
    all(:link, 'Add Comment').last.click
  end
   
  scenario 'successfully' do
    fill_in 'comment_body', with: new_comment
    click_button 'Create Comment'
    expect(find(".pagination").nil?).to be_falsy
    click_link("2")
    expect(all(:link, 'Add Comment').count).to eq(1)
  end
end