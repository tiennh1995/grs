class GenresController < ApplicationController
  def index
    @genres = Genre.all

    @games = if params[:genre_ids]
      Game.load_game_with_genres params[:genre_ids]
    else
      Game.all
    end
    @games = @games.includes :genres if @games
    @games = @games.page(params[:page]).per 9
  end
end
