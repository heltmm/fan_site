class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

def create
  @post = Post.new(post_params)
  if @post.save
    flash[:notice] = "Post successfully added!"
    redirect_to posts_path
  else
    render :new
  end
end

def show
  @post = Post.find(params[:id])
  @comments = @post.comments
  # @comment = @post.comments.new

end

def upvote
  @post= Post.find(params[:id])
  @post.upvote_by current_user
  @posts = Post.all
  redirect_to :posts
end

def downvote
  @post = Post.find(params[:id])
  @post.downvote_by current_user
  @posts = Post.all
  redirect_to :posts
end

private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
