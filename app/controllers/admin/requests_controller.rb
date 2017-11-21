class Admin::RequestsController < Admin::AdminController
  before_action :load_request, only: :update

  def index
    status = params[:status]
    status ||= "all"
    @requests = Request.send(status).includes(:user).page(params[:page]).per 9
  end

  def update
    if Request.statuses.include? request_params[:status]
      if @request.cancel? && request_params[:status] != "cancel"
        @request.reason = ""
        @request.save
      end
      @request.update_attributes request_params

      if @request.accepted?
        @genres = Genre.all
        redirect_to new_admin_game_path(game: {name: @request.game_name,
          required: @request.required, info: @request.info})
      end
    end
  end

  private
  def request_params
    params.require(:request).permit :status, :reason
  end

  def load_request
    @request = Request.find_by id: params[:id]
    unless @request
      flash[:danger] = "Request not exist!"
      redirect_to admin_requests_path
    end
  end
end
