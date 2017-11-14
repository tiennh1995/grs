class RatesController < ApplicationController
  before_action :authenticate_user!, :load_game, :check_rate?
  before_action :load_rate, only: [:update, :destroy]

  def create
    unless check_rate?
      @rate = Rate.new rate_params
      @rate.user = current_user
      @rate.game = @game
      if @rate.save
        flash[:success] = "Rate success."
        redirect_to @game
      end
    end
  end

  def update
    if @rate.update_attributes rate_params
      flash[:success] = "Update rate success."
      redirect_to @game
    end
  end

  def destroy
    @rate.destroy
  end

  private
  def rate_params
    params.require(:rate).permit :point
  end

  def authenticate_user!
    unless user_signed_in?
      respond_to do |format|
        format.html
        format.js {render :create}
      end
    end
  end

  def load_game
    @game = Game.find_by id: params[:game_id]
    unless @game
      flash[:danger] = "Game not exist!"
      redirect_to root_path
    end
  end

  def check_rate?
    current_user.rates.find_by game: @game
  end

  def load_rate
    @rate = Rate.find_by id: params[:id]
    unless @rate
      flash[:danger] = "Rate not exist!"
      redirect_to root_path
    end
  end
end
