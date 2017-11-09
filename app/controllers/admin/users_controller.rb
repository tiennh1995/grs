class Admin::UsersController < Admin::AdminController
  def index
    @users = User.user_alls.page(params[:page]).per 9
  end
end
