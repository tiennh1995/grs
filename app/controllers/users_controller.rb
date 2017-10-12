class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :load_user, only: [:show, :edit, :update]

  def show
    @reviews = @user.reviews.includes(:comments, :game).page(params[:page])
      .per 5
  end

  def edit
    if @user != current_user
      flash[:danger] = "Perrmission denied!"
      redirect_to root_path
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Change information success"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :avatar, :nick_name, :birthday, :sex
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = "User not exist!"
      redirect_to root_path
    end
  end
end
