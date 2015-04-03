module CommentsHelper
  def comments_tree_for(comments, tree)
    index = 0
    comments.map do |comment, nested_comments|
      index += 1
      comment.tree =  "#{tree}.#{index}"
      render(comment) + (nested_comments.blank? ? nil : content_tag(:div, comments_tree_for(nested_comments, comment.tree), class: "replies"))
    end.join.html_safe
  end
end
