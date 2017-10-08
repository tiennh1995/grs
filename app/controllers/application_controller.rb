class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

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
end
