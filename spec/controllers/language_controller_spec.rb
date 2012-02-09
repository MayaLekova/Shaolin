require 'spec_helper'

describe LanguageController do
  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
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
      post 'details', {id: 1}
      response.should be_success
    end
  end
end
