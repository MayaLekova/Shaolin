require 'spec_helper'

describe ParagraphsController do

  let(:valid_params) { { :body => 'paragraph body', :position => 1, :lesson_id => 1 } }

  before do
    Paragraph.stub(:find).and_return Factory :paragraph

  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', {:id => 1}
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create', valid_params
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do

    it "returns http success" do
      delete 'destroy', { id => 1 }
      response.should be_success
    end
  end

end
