require 'spec_helper'

describe SessionsController do

  describe "POST 'create'" do
    context "with valid data" do
      before do
        user = Factory :user
        user.stub(:authenticate).and_return true
        User.stub(:find_by_username).and_return user
      end

      it "logs in the user" do
        post 'create', :username => 'baba', :password => 'pena'
        session[:user_id].should eq 1
      end
    end

    context "given bad login data" do
      it "renders the login page again" do
        post 'create', :username => 'baba', :password => 'pena'
        response.should redirect_to 'new'
      end
    end
  end

  describe "'destroy'" do
    it "logs a user out" do
      delete 'destroy', :id => 1
      session[:user_id].should be_nil
    end

    it "redirects to the root page" do
      delete 'destroy', :id => 1
      response.should redirect_to root_url
    end
  end

end
