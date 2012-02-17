module ApplicationHelper

  def logged_in?
    current_user
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def is_admin?
    current_user.is_admin?
  end

end
