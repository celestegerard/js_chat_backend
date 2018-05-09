class Api::V1::MessagesController < ApplicationController

  def index
    messages = Message.all
    render json:messages
  end

  def create
    # byebug
    message = Message.create(message_params)
    render json:message
  end

  private
  def message_params
    params.require(:message).permit(:user_id,:body)
  end
end
