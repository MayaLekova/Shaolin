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
    task = Task.find(params[:id])
    lesson = Lesson.find(task.lesson_id)
    language = Language.find(lesson.language_id)
    
    source_file_name = "temp." + language.file_extension
    source_code = params[:code]
    save_source(source_file_name, source_code)
    
    @result = {}

    @result['compileStatus'] = system language.command.gsub("%{source_file}", source_file_name) + "> output.txt"
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
    task = Task.find(id)
    
    if not task.output.empty? then
      if @result['output'] == task.output then
        @result['message'] = "Correct"
      else
        @result['message'] = "Wrong!"
      end
      @result['expectation'] = task.expectation
    end
  end

end
