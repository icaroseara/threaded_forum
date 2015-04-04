class CommentsController < ApplicationController
  def new
    @comment = Services::Comments::InitializeService.new(params.permit(:post_id, :parent_id)).call    
  end
    
  def create
    service = Services::Comments::CreateService.new(comment_params)
    if service.is_valid?
      @comment = service.call
      redirect_to post_path(@comment.post)
    else
      redirect_to posts_path, status: 422     
    end  
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_id)
  end
end