require 'spec_helper'

describe "Languages" do
  describe "GET /languages" do
    context "without a logged in administrator" do
      it "fails" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get lessons_path
        response.status.should_not be(200)
      end

      it "redirects to the index" do
        get lessons_path
        response.should redirect_to root_url
      end
    end
  end
end
