# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    initial_code "MyText"
    expected "MyText"
    hint "MyText"
  end
end
