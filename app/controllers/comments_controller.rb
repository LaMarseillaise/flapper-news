class CommentsController < ApplicationController

  def create
    render json: Post.find(params[:post_id]).comments.create(comment_params)
  end

  def upvote
    @comment = Post.find(params[:post_id]).comments.find(params[:id])
    @comment.increment!(:upvotes)
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
