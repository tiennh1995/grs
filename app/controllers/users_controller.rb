class UsersController < ApplicationController
  before_action :load_user, only: :show

  def show
    @reviews = @user.reviews.includes(:comments, :game).page(params[:page])
      .per 5
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = "User not exist!"
      redirect_to root_path
    end
  end
end
