class Api::V1::RoomsController < ApplicationController

  def index
    render json:{rooms:Room.all}
  end
end
