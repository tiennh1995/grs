class RequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    status = params[:status]
    status ||= "all"
    @requests = current_user.requests.send(status).page(params[:page]).per 9
  end

  def new
    @request = current_user.requests.build
  end

  def create
    @request = current_user.requests.new request_params
    if @request.save
      flash[:success] = "Make request success"
      redirect_to user_requests_path(current_user)
    end
  end

  private
  def request_params
    params.require(:request).permit :game_name, :genre_info, :required, :info
  end
end
