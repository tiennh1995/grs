class PagesController < ApplicationController
  def show
    @games = Game.all
    @reviews = Review.all.page(params[:page]).per 5
  end
end
