# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :language do
    name "MyString"
    description "MyString"
    command "baba %{source_file} > %{output_file}"
    file_extension "MyString"
    wrapping_code "%{user_input}"
  end
end
