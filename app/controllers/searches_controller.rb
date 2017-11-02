class SearchesController < ApplicationController
  def index
    @result = Hash.new
    @result[:games] = Game.load_game_with_name params[:search]
    @result[:genres] = Genre.load_genre_with_name params[:search]
    @result[:reviews] = Review.load_review_with_title params[:search]
    @result[:users] = User.load_user_with_name params[:search]
  end
end
