require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LanguagesController do

  # This should return the minimal set of attributes required to create a valid
  # Language. As you add validations to Language, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      name: 'language name',
      command: 'dedo %{source_file} > %{output_file}',
      file_extension: 'de'
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LanguagesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before do
    controller.stub(:current_user => double({:is_admin? => true}))
  end

  describe "GET index" do
    it "assigns all languages as @languages" do
      language = Language.create! valid_attributes
      get :index, {}, valid_session
      assigns(:languages).should eq([language])
    end
  end

  describe "GET show" do
    it "assigns the requested language as @language" do
      language = Language.create! valid_attributes
      get :show, {:id => language.to_param}, valid_session
      assigns(:language).should eq(language)
    end
  end

  describe "GET new" do
    it "assigns a new language as @language" do
      get :new, {}, valid_session
      assigns(:language).should be_a_new(Language)
    end
  end

  describe "GET edit" do
    it "assigns the requested language as @language" do
      language = Language.create! valid_attributes
      get :edit, {:id => language.to_param}, valid_session
      assigns(:language).should eq(language)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Language" do
        expect {
          post :create, {:language => valid_attributes}, valid_session
        }.to change(Language, :count).by(1)
      end

      it "assigns a newly created language as @language" do
        post :create, {:language => valid_attributes}, valid_session
        assigns(:language).should be_a(Language)
        assigns(:language).should be_persisted
      end

      it "redirects to the created language" do
        post :create, {:language => valid_attributes}, valid_session
        response.should redirect_to(Language.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved language as @language" do
        # Trigger the behavior that occurs when invalid params are submitted
        Language.any_instance.stub(:save).and_return(false)
        post :create, {:language => {}}, valid_session
        assigns(:language).should be_a_new(Language)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Language.any_instance.stub(:save).and_return(false)
        post :create, {:language => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested language" do
        language = Language.create! valid_attributes
        # Assuming there are no other languages in the database, this
        # specifies that the Language created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Language.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => language.to_param, :language => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested language as @language" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => valid_attributes}, valid_session
        assigns(:language).should eq(language)
      end

      it "redirects to the language" do
        language = Language.create! valid_attributes
        put :update, {:id => language.to_param, :language => valid_attributes}, valid_session
        response.should redirect_to(language)
      end
    end

    describe "with invalid params" do
      it "assigns the language as @language" do
        language = Language.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Language.any_instance.stub(:save).and_return(false)
        put :update, {:id => language.to_param, :language => {}}, valid_session
        assigns(:language).should eq(language)
      end

      it "re-renders the 'edit' template" do
        language = Language.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Language.any_instance.stub(:save).and_return(false)
        put :update, {:id => language.to_param, :language => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested language" do
      language = Language.create! valid_attributes
      expect {
        delete :destroy, {:id => language.to_param}, valid_session
      }.to change(Language, :count).by(-1)
    end

    it "redirects to the languages list" do
      language = Language.create! valid_attributes
      delete :destroy, {:id => language.to_param}, valid_session
      response.should redirect_to(languages_url)
    end
  end

end
