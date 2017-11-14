class Admin::RequestsController < Admin::AdminController
  before_action :load_request, only: :update

  def index
    status = params[:status]
    status ||= "all"
    @requests = Request.send(status).includes(:user).page(params[:page]).per 9
  end

  def update
    if Request.statuses.include? request_params[:status]
      @request.update_attributes request_params
    end
  end

  private
  def request_params
    params.require(:request).permit :status
  end

  def load_request
    @request = Request.find_by id: params[:id]
    unless @request
      flash[:danger] = "Request not exist!"
      redirect_to admin_requests_path
    end
  end
end
