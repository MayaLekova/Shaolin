class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_url, notice: "Registered!"
    else
      render :new
    end
  end

  def give_points
    Rails.logger.debug "In User#give_points"
    lesson = Lesson.find params[:lesson_id]
    user = User.find session[:user_id]

    @result = {}

    user.points += lesson.points
    if user.save
      @result[:status] = 'OK'
    else
      @result[:status] = 'NOT OK'
    end
    respond_to do |format|
      format.json { render json: @result }
    end
  end

end
