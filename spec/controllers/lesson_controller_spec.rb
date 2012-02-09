require 'spec_helper'

describe LessonController do

  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'details'" do
    it "returns http success" do
      get 'details'
      response.should be_success
    end
  end

end
