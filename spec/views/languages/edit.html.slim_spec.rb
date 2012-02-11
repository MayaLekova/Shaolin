require 'spec_helper'

describe "languages/edit" do
  before(:each) do
    @language = assign(:language, stub_model(Language,
      :name => "MyString",
      :description => "MyString",
      :command => "MyString",
      :file_extension => "MyString",
      :wrapping_code => "MyText"
    ))
  end

  it "renders the edit language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => languages_path(@language), :method => "post" do
      assert_select "input#language_name", :name => "language[name]"
      assert_select "input#language_description", :name => "language[description]"
      assert_select "input#language_command", :name => "language[command]"
      assert_select "input#language_file_extension", :name => "language[file_extension]"
      assert_select "textarea#language_wrapping_code", :name => "language[wrapping_code]"
    end
  end
end
