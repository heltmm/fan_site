class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def upvote
    @comment= Comment.find(params[:id])
    @comment.upvote_by current_user
    @comments = Comment.all
    redirect_to post_comments_path
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    @comments = Comment.all
    redirect_to post_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
