module Services::Comments
  class ShowService < Services::Base    
    attr_accessor :post
    attr_accessor :page
    
    validates_presence_of :post
  
    def call
      if valid?
        page.present? ? Comment.fetch_children_for_roots(post, post.comments.page(page).roots) : post.comments.page(page)
      else
        false
      end
    end
    
    def is_valid?
      valid?
    end
  end
end