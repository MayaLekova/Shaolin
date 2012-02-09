# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :language do
    name "MyString"
    description "MyText"
    execution_command_format "MyString"
    source_file_extension "MyString"
    wrapping_code "MyText"
  end
end
