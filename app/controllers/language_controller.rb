class LanguageController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |err|
    @error = err
    render "layouts/error.html.slim"
  end

  def list
    @languages = Language.all or []

    respond_to do |format|
      format.html
      format.xml { render :xml => @languages.to_xml }
      format.json { render :json => @languages.to_json }
    end
  end

  def update
    if params[:id] and not params[:id] == ''
      Rails.logger.debug "[1;33mTODO[0m: [1mIt would be nice to implement updating existing language settings[0m"
    else
      @language = Language.new params.slice(:name, :execution_command_format, :source_file_extension)
      if @language.valid?
        @language.save
      else
        @error = "Watch out! We got a badass over here!"
        render "layouts/error.html.slim"
      end
    end

    redirect_to "/language/list"
  end

  def details
    if params[:id]
      @language = Language.find(params[:id])
    else
      @language = Language.new
    end
  end
end
