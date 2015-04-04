require "spec_helper"

feature 'Create a post', type: :feature do
  background { visit root_path }

  let(:subject) { Faker::Lorem.sentence }
  
  scenario 'successfully' do
    fill_in 'post_subject', with: subject
    click_button 'Create Post'
    expect(page).to have_content subject
  end
  
  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Create Post'
    expect(current_path).to eql '/posts'
    expect(page).to have_content I18n.t("posts.invalid")
  end
end