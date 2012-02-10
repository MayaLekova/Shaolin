class LessonController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |err|
    @error = err
    render "layouts/error.html.slim"
  end

  def show
    @lessons = Lesson.all or []

    respond_to do |format|
      format.html
      format.xml { render :xml => @lessons.to_xml }
      format.json { render :json => @lessons.to_json }
    end
  end

  def new
      @lesson = Lesson.new params.slice(:topic, :body, :language_id)
      if @lesson.valid?
        @lesson.save
      else
        @error = "Watch out! We got a wrong lesson over here!"
        render "layouts/error.html.slim" and return
      end
  end

  def update
  end

  def details
    if params[:id]
      @language = Language.find(params[:id])
    else
      @language = Language.new
    end
  end

end
