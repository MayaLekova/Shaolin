# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    title "MyString"
    description "MyString"
    points 1
    language_id 1
  end
end
