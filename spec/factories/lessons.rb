# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    topic "MyString"
    body "MyText"
    points 1
    language_id 1
    number 1
  end
end
