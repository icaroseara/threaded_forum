class CommentsController < ApplicationController
  def new
    if params[:parent_id]
      parent = Comment.find(params[:parent_id])
      @comment = Comment.new(parent_id: params[:parent_id],post_id: parent.post_id )
    else
      @comment = Comment.new(post_id: params[:post_id])
    end
  end
    
  def create
    if comment_params[:parent_id].present?
      parent = Comment.find(comment_params[:parent_id])
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render 'new'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_id)
  end
end