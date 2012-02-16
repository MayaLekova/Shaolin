class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username params[:username]
    if user and user.authenticate params[:password]
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = "Invalid username/password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    Rails.logger.debug "\n\n\nLoggin out\n\n\n"
  end

end
