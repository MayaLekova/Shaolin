require 'spec_helper'

describe "users/new.html.slim" do
  before(:each) do
    assign(:user, stub_model(User,
      :user_uesrname => nil,
      :email => nil,
    ).as_new_record)
  end

  it "renders a form for registering a user" do
    render

    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_email", :name => "user[email]"
    end
  end
end
