module Services::Posts
  class CreateService < Services::Base    
    attr_accessor :subject
    
    validates_presence_of :subject
    
    def call
      Post.create(subject: subject)
    end
    
    def is_valid?
      valid? 
    end
  end
end