class ApplicationController < ActionController::Base
  protect_from_forgery

  def logged_in?
    current_user
  end

  def current_user
    session[:user_id] and User.find(session[:user_id])
  end

  def logged_in_as_admin?
    current_user.try(:is_admin?)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You need to be logged in to do that"
      redirect_to new_session_path
    end
  end

  def require_admin
    unless logged_in_as_admin?
      flash[:error] = "You need to be an administrator to do that"
      redirect_to root_url
    end
  end

end
