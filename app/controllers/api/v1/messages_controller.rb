class Api::V1::MessagesController < ApplicationController

  def index
    room = Room.find(params[:room_id])
    messages = room.messages
    render json:messages
  end

  def create
    message = Message.create(message_params)
    render json:message
  end

  private
  def message_params
    params.require(:message).permit(:user_id,:room_id,:body)
  end
end
