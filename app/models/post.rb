class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  
  validates :subject, presence: true
end
