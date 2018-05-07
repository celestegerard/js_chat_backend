class ApplicationController < ActionController::API

  def validate_session
    render json:{error:"Unauthorized user"} unless !!current_user
  end

  def current_user
    if user = set_user(request.headers["userId"].to_i)
      @user = user if Digest::SHA256.base64digest("#{user.created_at}") == request.headers["token"]
    else
      nil
    end
  end

  def set_user(id)
    begin
      User.find(id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

end
