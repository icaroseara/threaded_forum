require "spec_helper"

feature 'Create other comment' do
  let(:subject) { Faker::Lorem.sentence }
  let(:comment) { Faker::Lorem.paragraph }
  let(:new_comment) { Faker::Lorem.paragraph }
    
  background { create_comment_with subject, comment  }
   
  scenario 'successfully' do
    all(:link, 'Add Comment').last.click
    fill_in 'comment_body', with: new_comment
    click_button 'Create Comment'
    expect(page).to have_content new_comment
  end
  
  scenario 'unsuccessfully due to required fields being blank' do
    all(:link, 'Add Comment').last.click
    click_button 'Create Comment'
    expect(page).to_not have_content subject
  end
end