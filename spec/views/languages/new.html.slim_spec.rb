require 'spec_helper'

describe "languages/new" do
  before(:each) do
    assign(:language, stub_model(Language,
      :name => "MyString",
      :description => "MyString",
      :command => "MyString",
      :file_extension => "MyString",
      :wrapping_code => "MyText"
    ).as_new_record)
  end

  it "renders new language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => languages_path, :method => "post" do
      assert_select "input#language_name", :name => "language[name]"
      assert_select "input#language_description", :name => "language[description]"
      assert_select "input#language_command", :name => "language[command]"
      assert_select "input#language_file_extension", :name => "language[file_extension]"
      assert_select "textarea#language_wrapping_code", :name => "language[wrapping_code]"
    end
  end
end
