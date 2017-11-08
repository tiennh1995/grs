class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?
  before_action :authorize_user

  protected
  def load_popular_games
    @top_games = Game.top_games.includes :genres
    @recent_games = Game.recent_games.includes :genres
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :nick_name, :avatar, :email, :password,
        :password_confirmation, :sex
    end
  end

  def storable_location?
    request.get? && is_navigational_format? &&
      !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for :user, request.fullpath
  end

  def after_sign_in_path_for resource
    request.env["omniauth.origin"] ||
      stored_location_for(resource) || root_path
  end

  def authorize_user
    if controller_path != "devise/sessions" && current_user &&
      current_user.admin?
      redirect_to admin_root_path unless controller_path.index "admin"
    end
  end
end
