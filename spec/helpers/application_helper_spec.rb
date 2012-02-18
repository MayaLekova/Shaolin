require 'spec_helper'

describe ApplicationHelper do
  describe "logged_in?" do
    context "when there is a user" do
      before do
        session[:user_id] = 1
        User.stub(:find).and_return Factory :user
      end

      it "returns true" do
        logged_in?.should_not be_nil
      end
    end

    context "when there is no user" do
      it "returns false" do
        logged_in?.should be_nil
      end
    end
  end

  describe "is_admin?" do
    context "if logged in as admin" do
      before do
        session[:user_id] = 1
        User.stub(:find_).and_return Factory :admin
      end

      it "returns true" do
        is_admin?.should be_true
      end
    end
  end

end
