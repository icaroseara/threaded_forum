class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order(created_at: :asc).page params[:page]
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      redirect_to posts_path
    end
  end
  
  def show
    @post = Post.find(params[:id])        
  end
  
  private 
  def post_params
    params.require(:post).permit(:subject)
  end
end
