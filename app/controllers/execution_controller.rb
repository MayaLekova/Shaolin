class ExecutionController < ApplicationController
  def execute
    source_file_name = "temp." + language.file_extension
    source_code = language.wrapping_code % {user_input: params[:code]}
    save_source(source_file_name, source_code)
    
    @result = { :expected => task.expected }

    @result['compileStatus'] = system language.command % {source_file: source_file_name} + "> output.txt"
    @result['output'] = ""
    
    IO.foreach("output.txt"){|block|
      @result['output'] += block.strip
    }
    
    match(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @result }
    end
  end
  
  def save_source(file_name, source_code)
    source_file = File.open(file_name, "w")
    source_file.syswrite(source_code + "\n")
    source_file.close
  end

  def match(id)
    if not task.expected.empty? then
      if @result['output'] == task.expected then
        @result['message'] = "Correct"
      else
        @result['message'] = "Wrong!"
      end
      @result['hint'] = task.hint
    end
  end

  private
  def task
    Task.find params[:id]
  end

  def lesson
    task.lesson
  end

  def language
    lesson.language
  end

end
