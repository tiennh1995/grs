class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = current_user.invole_reviews.includes(:comments, :game)
      .page(params[:page]).per 5
    @top_games = Game.top_games.includes :genres
    @recent_games = Game.recent_games.includes :genres
  end
end
