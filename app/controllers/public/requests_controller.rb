class Public::RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    @request.save
    redirect_to public_games_path
  end

  private

  def request_params
    params.require(:request).permit(:title)
  end
end
