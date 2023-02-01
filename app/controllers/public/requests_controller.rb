class Public::RequestsController < ApplicationController
  before_action :authenticate_user!
  def create
    @request = Request.new(request_params)
    if Game.exists?(title: @request.title)
      redirect_to public_games_path, notice: 'そのゲームはすでに実装されています。検索してみてください。'
    elsif Request.exists?(title: @request.title)
      redirect_to public_games_path, notice: 'ありがとうございます。実装までしばらくお待ちください。'
    else
      @request.save
      redirect_to public_games_path, notice: 'ありがとうございます。実装までしばらくお待ちください。'
    end
  end

  private

  def request_params
    params.require(:request).permit(:title)
  end
end
