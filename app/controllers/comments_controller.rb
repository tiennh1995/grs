class CommentsController < ApplicationController
  before_action :authenticate_user!, :load_review
  before_action :load_comment, only: [:edit, :update, :destroy]

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.new comment_params
    @comment.review = @review
    @comment.save
  end

  def edit
  end

  def update
    @comment.update_attributes comment_params
  end

  def destroy
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end

  def authenticate_user!
    unless user_signed_in?
      respond_to do |format|
        format.html
        format.js {render :new}
      end
    end
  end

  def load_review
    @review = Review.find_by id: params[:review_id]
    unless @review
      flash[:danger] = "Review not exist!"
      redirect_to root_path
    end
  end

  def load_comment
    @comment= Comment.find_by id: params[:id]
    unless @comment
      flash[:danger] = "Comment not exist!"
      redirect_to root_path
    end
  end
end
