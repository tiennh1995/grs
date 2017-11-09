class Admin::RequestsController < Admin::AdminController
  def index
    status = params[:status]
    status ||= "all"
    @requests = Request.send(status).page(params[:page]).per 9
  end
end
