class PostsController < ApplicationController

  def index
    render json: Post.all
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    render json: Post.create(post_params)
  end

  def upvote
    @post = Post.find(params[:id])
    @post.increment!(:upvotes)
    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
