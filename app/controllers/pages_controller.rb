class PagesController < ApplicationController
  def show
    @top_games = Game.top_games.includes :genres
    @recent_games = Game.recent_games.includes :genres
    @reviews = Review.top_reviews.includes(:comments, :game)
      .page(params[:page]).per 5
  end
end
