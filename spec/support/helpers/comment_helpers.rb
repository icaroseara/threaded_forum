module CommentHelpers
  def create_comment_with subject, comment
    create_post_with subject
    click_link 'Add Comment'
    fill_in 'comment_body', with: comment
    click_button 'Create Comment'
  end
end