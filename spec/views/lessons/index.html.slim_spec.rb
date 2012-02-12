require 'spec_helper'

describe "lessons/index" do
  before(:each) do
    assign(:lessons, [
      stub_model(Lesson,
        :title => "Title",
        :description => "Description",
        :points => 1,
        :language_id => 1
      ),
      stub_model(Lesson,
        :title => "Title",
        :description => "Description",
        :points => 1,
        :language_id => 1
      )
    ])
  end

  before do
    Language.stub(:find).and_return Factory :language
  end

  it "renders a list of lessons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
