class ApplicationController < ActionController::API

  def validate_session
    render json:{error:"Unauthorized user"} unless !!current_user
  end

  def current_user
    @user = set_user(request.headers["userName"])
  end

  def set_user(user_name)
    begin
      User.find_by(username:user_name)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

end
