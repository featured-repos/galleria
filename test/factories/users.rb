FactoryGirl.define do
  factory :user do
    username { Faker::Internet.unique.user_name }
    password "MyString"
    email "MyString"
  end
end
