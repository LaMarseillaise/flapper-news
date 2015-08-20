class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:create, :upvote]

  def create
    render json: current_user.comments.create(comment_params.merge(post_id: params[:post_id]))
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
