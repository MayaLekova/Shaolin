require 'spec_helper'

describe ExecutionController do

  describe "GET 'execute'" do
    it "returns http success" do
      get 'execute'
      response.should be_success
    end
  end

  describe "'match'" do
    before do
      task = Factory :task
      task.stub(:expected).and_return "Expected"
      Task.stub(:find).and_return task
    end
    
    it "recognizes correct output" do
      @result = {'output' => "Expected"}
      controller.match(1)
      @result['message'].should eq "Correct"
    end

    it "recognizes incorrect output" do
      @result = {'output' => "Not expected"}
      controller.match(1)
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
