class Comment < ActiveRecord::Base
  attr_accessor :tree
  
  belongs_to :post
  
  validates :body, presence: true
  
  acts_as_tree order: 'created_at DESC'
  
  paginates_per 10
  
  def self.fetch_children_for_roots(postable, roots)
    unless roots.blank?
      condition = roots.select{|r|r.descendants.count > 0}.collect{|r| "(parent_id like '#{r.id}%')"}.join(' or ')
      unless condition.blank?
        children = postable.comments.where(condition)
        roots.concat children
      end
    end
    roots
  end
end
