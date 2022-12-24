class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.create
    @current_entry = Entry.create(user_id: current_user.id, room_id: room.id)
    @anoter_entry = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    redirect_to public_room_path(room.id)
  end

  def index
    current_entries = Entry.where(user_id: current_user.id)
    my_room_id = []
    current_entries.each do |entry|
      my_room_id << entry.room.id
    end
    @another_entries = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @anoter_entry = @entries.where.not(user_id: current_user.id).first
  end
end
