class Admin::AdminController < ApplicationController
  layout "admin/application"

  before_action :authenticate_user!, :authorize_user

  protected
  def authorize_user
    redirect_to root_path unless current_user.admin?
  end
end
