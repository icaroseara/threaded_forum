module Services::Comments
  class CreateService < Services::Base    
    attr_accessor :parent_id
    attr_accessor :post_id
    attr_accessor :body
    
    validates_presence_of :body
    
    def call      
      if is_valid?
        parent_id.present? ? Comment.find(parent_id).children.create(parent_id: parent_id, post_id: post_id, body: body) : Comment.create(parent_id: parent_id, post_id: post_id, body: body)
      else
        false
      end
    end
    
    def is_valid?
      valid? && (parent_id.present? || post_id.present?)
    end
  end
end