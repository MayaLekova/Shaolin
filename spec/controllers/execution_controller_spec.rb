require 'spec_helper'

describe ExecutionController do

  describe "GET 'execute'" do
    it "returns http success" do
      get 'execute'
      response.should be_success
    end
  end

  describe "GET 'match'" do
    it "returns http success" do
      get 'match'
      response.should be_success
    end
  end

end
