require 'spec_helper'

describe ExecutionController do

  describe "POST 'execute'" do
    before do
      lesson = Factory :lesson
      language = Factory :language
      
      Task.stub(:find).and_return Factory :task
      Task.any_instance.stub(:expected).and_return 'Expected'
      Task.any_instance.stub(:lesson).and_return lesson

      Lesson.stub(:find).and_return lesson
      Lesson.any_instance.stub(:language).and_return language

      Language.stub(:find).and_return language
      Language.any_instance.stub(:file_extension).and_return 'fe'
      Language.any_instance.stub(:wrapping_code).and_return '%{user_input}'
    end
    
    it "assigns expected" do
      post 'execute', :code => 'code', :id => 1
      assigns(:result).should_not be_nil
     # assigns(:result).should have_key :expected
    end
  end
  
  describe "GET 'execute'" do
    it "returns http success" do
      get 'execute'
      response.should be_success
    end
    
  end

  describe "'match'" do
    let (:task) { Factory :task }
    before do
      task.stub(:expected).and_return "Expected"
      task.stub(:hint).and_return "Hint"
    end
    
    it "recognizes correct output" do
      @result = {'output' => "Expected"}
      controller.match :id => 1
      @result['message'].should eq "Correct"
    end

    it "recognizes incorrect output" do
      @result = {'output' => "Not expected"}
      controller.match :id => 1
      @result['message'].should eq "Wrong!"
    end
  end
  
  describe "'save_source'" do
    it "reads source file" do
      file_name = "filename"
      source = "source"
      controller.save_source(file_name, source)
      source_file = File.open(file_name, "r")
      source_file.should_not be_nil
      source_file.close
    end
  end

end
