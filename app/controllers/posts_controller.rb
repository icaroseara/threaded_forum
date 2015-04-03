class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :asc)
  end
  
  private 
  def post_params
    params.require(:post).permit(:subject)
  end
end
