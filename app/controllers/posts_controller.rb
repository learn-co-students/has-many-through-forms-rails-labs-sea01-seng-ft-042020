class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # @new_comments = @post.comments.build
    @comment = Comment.new
    @comment.post_id = @post.id

  end

  def index
    @posts = Post.all
  end

  def update

  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
