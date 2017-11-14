class Admin::GamesController < Admin::AdminController
  before_action :load_game, except: [:index, :new, :create]

  def index
    @games = Game.all.page(params[:page]).per 9
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    if @game.destroy
      flash[:success] = "Delete game success."
      redirect_to admin_root_path
    end
  end

  private
  def game_params
    params.require(:game).permit :name, :required, :info, :cover
  end

  def load_game
    @game = Game.find_by id: params[:id]
    unless @game
      flash[:danger] = "Game not exist!"
      redirect_to admin_root_path
    end
  end
end
