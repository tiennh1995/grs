class ReviewsController < ApplicationController
  before_action :authenticate_user!, :load_popular_games

  def index
    @reviews = current_user.invole_reviews.includes(:comments, :game)
      .page(params[:page]).per 5
  end
end
