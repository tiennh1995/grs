class Admin::GamesController < Admin::AdminController
  before_action :load_game, except: [:index, :new, :create]

  def index
    @games = Game.all.page(params[:page]).per 9
  end

  def new
    @game = if params[:game]
      @game = Game.new game_params
    else
      Game.new
    end
    @genres = Genre.all
  end

  def create
    @game = Game.create_game_with_genres game_params,
      params[:genre_ids] || []
    if @game.errors.any?
      @genres = Genre.all
      @game.cover = nil
      @game.screenshots = []
      render :new
    else
      flash[:success] = "Create game success."
      redirect_to [:admin, @game]
    end
  end

  def show
  end

  def edit
    @genres = Genre.all
  end

  def update
    if @game.update_attributes game_params
      flash[:success] = "Update game success."
      redirect_to [:admin, @game]
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    if @game.destroy
      flash[:success] = "Delete game success."
      redirect_to admin_root_path
    end
  end

  private
  def game_params
    params.require(:game).permit :name, :required, :info, :cover,
      screenshots_attributes: [:id, :game_id, :image, :_destroy],
      genres_attributes: [:id, :name, :code, :_destroy]
  end

  def load_game
    @game = Game.find_by id: params[:id]
    unless @game
      flash[:danger] = "Game not exist!"
      redirect_to admin_root_path
    end
  end
end
