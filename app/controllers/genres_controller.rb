class GenresController < ApplicationController
  before_action :load_genre, only: :show
  before_action :load_popular_games, only: :index

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

  def show
    @games = @genre.games.includes(:genres).page(params[:page]).per 9
  end

  private
  def load_genre
    @genre = Genre.find_by id: params[:id]
    unless @genre
      flash[:danger] = "Genre not exist!"
      redirect_to root_path
    end
  end
end
