class ApplicationController < ActionController::API
  
  def validate_session
    render json:{error:"Unauthorized user"} unless !!current_user
  end

  def current_user
    token = request.headers["token"]
    user_id = request.headers["userId"]
    if user = User.find(user_id.to_i)
      @user = user if Digest::SHA256.base64digest("#{user.created_at}") == token
    else
      nil
    end
  end

end
