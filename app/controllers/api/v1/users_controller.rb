class Api::V1::UsersController < ApplicationController
  before_action :validate_session, only: [:show]
  def create
    @user = User.create(user_params)
    if @user.valid?
      response = {
        :user_name => @user.username
      }
    else
      response = {error: "Invalid user"}
    end
    render json: response
  end

  def show
    render json: {username: @user.username}
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end