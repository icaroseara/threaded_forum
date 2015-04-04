module PostHelpers
  def create_post_with subject
    visit root_path
    fill_in 'post_subject', with: subject
    click_button 'Create Post'
  end
end