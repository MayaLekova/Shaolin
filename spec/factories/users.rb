# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    email "MyString"
    password "MyString"
    is_admin false
    points 1
  end

  factory :admin, :class => User do
    username "MyString"
    email "MyString"
    password "parola"
    is_admin true
    points 1
  end
end
