require 'spec_helper'

describe "lessons/new" do
  before(:each) do
    assign(:lesson, stub_model(Lesson,
      :title => "MyString",
      :description => "MyString",
      :points => 1,
      :language_id => 1
    ).as_new_record)
  end

  before do
    Language.stub(:find).and_return Factory :language
  end

  it "renders new lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_title", :name => "lesson[title]"
      assert_select "input#lesson_description", :name => "lesson[description]"
      assert_select "input#lesson_points", :name => "lesson[points]"
      assert_select "select#lesson_language_id", :name => "lesson[language_id]"
    end
  end
end
