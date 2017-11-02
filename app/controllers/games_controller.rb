class GamesController < ApplicationController
  before_action :load_game, only: :show
  before_action :load_popular_games, only: [:index, :show]

  def index
    if current_user && params[:followed]
      @games = current_user.send params[:followed]
    end
    @games ||= Game.all
    if params[:game_name]
      @games = @games.load_game_with_name params[:game_name]
    end
    @games = @games.includes(:genres).page(params[:page]).per 9
  end

  def show
    @rate = current_user.rates.find_by game: @game if current_user
    @rate ||= Rate.new
  end

  private
  def load_game
    @game = Game.find_by id: params[:id]
    unless @game
      flash[:danger] = "Game not exist!"
      redirect_to root_path
    end
  end
end
