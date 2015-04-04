class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order(created_at: :asc).page params[:page]
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = Services::Comments::ShowService.new(post: @post, page: params[:page]).call
  end
  
  def create
    service = Services::Posts::CreateService.new(post_params)
    if service.is_valid?
      @post = service.call
      redirect_to @post
    else
      redirect_to posts_path, flash:  { error: I18n.t("posts.invalid") }
    end
  end
  
  private 
  def post_params
    params.require(:post).permit(:subject)
  end
end
