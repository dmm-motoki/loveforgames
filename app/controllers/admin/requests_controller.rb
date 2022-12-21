class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.all.page(params[:page]).per(20)
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to admin_requests_path
  end
end
