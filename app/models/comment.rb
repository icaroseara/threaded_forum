class Comment < ActiveRecord::Base
  attr_accessor :tree
  
  belongs_to :post
  
  validates :body, presence: true
  
  acts_as_tree order: 'created_at DESC'
end
