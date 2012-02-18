require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    it "sets the greeting text" do
      get 'index'
      assigns(:home_title).should eq "Welcome to Shaolin!"
      assigns(:home_text).should eq <<EXPECTEDHOMETEXT
    Shaolin is a dynamic platform for programming lessons in various languages. You can access lessons on the right from the 'Lessons' menu.
EXPECTEDHOMETEXT
    end
  end
end
