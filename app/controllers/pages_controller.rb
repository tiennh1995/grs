class PagesController < ApplicationController
  def show
    @games = Game.all.includes :genres
    @reviews = Review.all.includes(:comments, :game).page(params[:page]).per 5
  end
end
