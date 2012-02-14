class LanguagesController < ApplicationController
  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @languages }
    end
  end

  def compile
    sourceCode = params[:code]
    sourceFile = File.open("temp.cpp", "w")
    sourceFile.syswrite(sourceCode)
    sourceFile.close
    
    @result = {}
    @result['compileStatus'] = system "g++ temp.cpp -o temp.exe > sys_output.txt"
    system "temp.exe > output.txt"
    
    fileEmpty = true
    IO.foreach("output.txt"){|block|
      if block == "Na baba CPP prilojenieto!!!!!!!!" then
	@result['message'] = "Correct"
      else
	@result['message'] = "Wrong!"
      end
      fileEmpty = false
    }
    if fileEmpty then @result['message'] = "Empty output file" end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @result }
    end
  end
    
  # GET /languages/1
  # GET /languages/1.json
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.json
  def new
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find(params[:id])
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to @language, notice: 'Language was successfully created.' }
        format.json { render json: @language, status: :created, location: @language }
      else
        format.html { render action: "new" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.json
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to @language, notice: 'Language was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to languages_url }
      format.json { head :ok }
    end
  end
end
