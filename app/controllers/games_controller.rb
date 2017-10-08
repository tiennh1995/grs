class GamesController < ApplicationController
  before_action :load_game, :load_popular_games, only: :show

  def show
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
