module Services::Comments
  class InitializeService < Services::Base    
    attr_accessor :parent_id
    attr_accessor :post_id
    attr_accessor :post
    
    def call
      Comment.new(parent_id: parent_id, post_id: post.id) if is_valid?
    end
    
    def is_valid?
      (parent_id.present? || post_id.present?) && post_exists?
    end
    
    private
    def post_exists?
      self.post = post_id.present? ? Post.find(post_id) : Comment.find(parent_id).post
      errors.add(:post, :invalid) unless post
      valid?
    end
  end
end