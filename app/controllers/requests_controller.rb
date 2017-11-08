class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = current_user.requests.build
  end

  def create
    @request = current_user.requests.new request_params
    if @request.save
      flash[:success] = "Make request success"
      redirect_to root_path
    end
  end

  private
  def request_params
    params.require(:request).permit :game_name, :genre_info, :required, :info
  end
end
