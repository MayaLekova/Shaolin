require 'spec_helper'

describe "language/details.html.slim" do
  before do
    @language = Factory.stub :language
  end

  it "renders successfully" do
    render 
  end
end
