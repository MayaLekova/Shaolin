require 'spec_helper'

describe UsersController do

  let(:valid_params) { { user: {username: 'pencho', email: 'pencho@mail.bg', password: 'parola', password_confirmation: 'parola'} } }
  let(:invalid_params_unmatching) { { user: {username: 'pencho', email: 'pencho@mail.bg', password: 'parola', password_confirmation: 'neparola'} } }

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "assigns a new user to @user" do
      get 'new'
      assigns(:user).should be_new_record
    end
  end

  describe "POST 'create'" do
    context "given valid user data" do
      it "creates the user" do
        post 'create', valid_params
        assigns(:user).should_not be_new_record
      end
      
      it "sets a notice" do
        post 'create', valid_params
        response.should redirect_to root_url
      end
    end

    context "given nonmatching passwords" do
      it "does not create a user" do
        post 'create', invalid_params_unmatching
        User.all.should be_empty
      end

      it "informs of the error" do
        post 'create', invalid_params_unmatching
        assigns(:user).errors.should be_any
      end
    end
  end

end
