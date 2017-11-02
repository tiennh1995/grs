class GameFollowsController < ApplicationController
  before_action :authenticate_user!, :load_game
  before_action :load_game_follow, only: :destroy

  def create
    @game_follow = GameFollow.new game: @game, user: current_user
    @game_follow.save
  end

  def destroy
    @game_follow.destroy
  end

  private
  def load_game
    @game = Game.find_by id: params[:game_id]
    unless @game
      flash[:danger] = "Game not exist!"
      redirect_to root_path
    end
  end

  def load_game_follow
    @game_follow = GameFollow.find_by id: params[:id]
    unless @game_follow
      flash[:danger] = "GameFollow not exist!"
      redirect_to root_path
    end
  end
end
