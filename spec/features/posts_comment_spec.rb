require "spec_helper"

feature 'Create a first comment', type: :feature do
  let(:subject) { Faker::Lorem.sentence }
  let(:comment) { Faker::Lorem.paragraph }
  
  background { create_post_with subject  }
  
  scenario 'successfully' do
    click_link 'Add Comment'
    fill_in 'comment_body', with: comment
    click_button 'Create Comment'
    expect(page).to have_content comment
  end
  
  scenario 'unsuccessfully due to required fields being blank' do
    click_link 'Add Comment'
    click_button 'Create Comment'
    expect(page).to_not have_content subject
  end
end