class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_request, only: [:edit, :update, :destroy]

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
      flash[:success] = "Make request success."
      redirect_to user_requests_path(current_user)
    end
  end

  def edit
  end

  def update
    if @request.update_attributes request_params
      flash[:success] = "Update request success."
      redirect_to user_requests_path(current_user)
    end
  end

  def destroy
    @request.destroy
  end

  private
  def request_params
    params.require(:request).permit :game_name, :genre_info, :required, :info
  end

  def load_request
    @request = Request.find_by id: params[:id]
    unless @request
      respond_to do |format|
        flash[:danger] = "Request invalid!"
        format.js {render js: "window.location.href =
          '#{user_requests_path(current_user)}'"}
        format.html {redirect_to root_path}
      end
    end
  end
end
