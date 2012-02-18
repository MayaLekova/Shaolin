=begin
AJAX query for Python:
$.ajax({
type:'POST',
url:'http://localhost:3000/language/compile',
'data': {'id': 1, 'code': 'a = 42; print(a)'},
'success': function() {console.log(arguments)},
'dataType': 'json'
});

=end

class ExecutionController < ApplicationController
  def execute
    source_file_name = "temp." + language.file_extension
    source_code = params[:code]
    if language.wrapping_code then
      source_code = language.wrapping_code % {user_input: source_code}
    end
    save_source(source_file_name, source_code)
    
    @result = {}

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
  
  private
  
  def save_source(filename, source_code)
    source_file = File.open(filename, "w")
    source_file.syswrite(source_code)
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
