class ReplyCommentsController < ApplicationController
  before_action :authenticate_user!, :load_comment
  before_action :load_reply_user, only: [:new, :create]
  before_action :load_reply_comment, only: [:edit, :update, :destroy]

  def index
    @reply_comments = @comment.reply_comments.includes :user
  end

  def new
    @reply_comment = current_user.reply_comments.build
    @reply_comment.reply_user = @reply_user if @reply_user
  end

  def create
    @reply_comment = current_user.reply_comments.new reply_comment_params
    @reply_comment.comment = @comment
    if params[:reply_comment] && params[:reply_comment][:reply_user_id]
      @reply_comment.reply_user_id = params[:reply_comment][:reply_user_id]
    end
    @reply_comment.save
  end

  def edit
  end

  def update
    @reply_comment.update_attributes reply_comment_params
  end

  def destroy
    @reply_comment.destroy
  end

  private
  def reply_comment_params
    params.require(:reply_comment).permit :content
  end

  def authenticate_user!
    unless user_signed_in?
      respond_to do |format|
        format.html
        format.js {render :new}
      end
    end
  end

  def load_comment
    @comment = Comment.find_by id: params[:comment_id]
    unless @comment
      flash[:danger] = "Comment not exist!"
      redirect_to root_path
    end
  end

  def load_reply_user
    if params[:reply_user_id]
      @reply_user = User.find_by id: params[:reply_user_id]
      unless @reply_user
        flash[:danger] = "User not exist!"
        redirect_to root_path
      end
    end
  end

  def load_reply_comment
    @reply_comment = ReplyComment.find_by id: params[:id]
    unless @reply_comment
      flash[:danger] = "ReplyComment not exist!"
      redirect_to root_path
    end
  end
end
