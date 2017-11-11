class Admin::GenresController < Admin::AdminController
  def index
    @genres = Genre.all.page(params[:page]).per 2
  end
end
