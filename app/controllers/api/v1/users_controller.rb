class Api::V1::UsersController < ApplicationController
  before_action :validate_session, only: [:show]
  require 'digest'
  def create
    @user = User.create(user_params)
    render json: {:user_name => @user.username, :token => Digest::SHA256.base64digest("#{@user.created_at}")}
  end

  def show
    render json: {username: @user.username}
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end