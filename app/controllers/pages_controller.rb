class PagesController < ApplicationController
  before_action :load_popular_games, only: :show

  def show
    @reviews = Review.top_reviews.includes(:comments, :game)
      .page(params[:page]).per 5
  end
end
