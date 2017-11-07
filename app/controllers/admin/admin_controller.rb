class Admin::AdminController < ApplicationController
  layout "admin/application"

  before_action :authorize_user

  protected
  def authorize_user
    redirect_to root_path unless current_user && current_user.admin?
  end
end
