class Admin::GamesController < Admin::AdminController
  def index
    @games = Game.all.page(params[:page]).per 9
  end
end
