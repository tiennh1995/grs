class Admin::GenresController < Admin::AdminController
  before_action :load_genre, except: [:index, :new, :create]

  def index
    @genres = Genre.all.page(params[:page]).per 9
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      flash[:success] = "Create genre success."
      redirect_to [:admin, @genre]
    else
      respond_to do |format|
        format.html {render :new}
        format.js
      end
    end
  end

  def show
    @games = @genre.games.includes(:genres).page(params[:page]).per 9
  end

  def edit
  end

  def update
    if @genre.update_attributes genre_params
      flash[:success] = "Update genre success."
      redirect_to [:admin, @genre]
    else
      respond_to do |format|
        format.html {render :edit}
        format.js
      end
    end
  end

  def destroy
    if @genre.destroy
      @genres = Genre.all.page(params[:page]).per 2
      flash[:success] = "Delete game success."
      redirect_to admin_genres_path
    else
      flash[:danger] = "Delete genre fail!"
      redirect_to [:admin, @genre]
    end
  end

  private
  def genre_params
    params.require(:genre).permit :name, :code
  end

  def load_genre
    @genre = Genre.find_by id: params[:id]
    unless @genre
      flash[:danger] = "Genre not exist!"
      redirect_to admin_root_path
    end
  end
end
