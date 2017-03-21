FactoryGirl.define do
  factory :photo do
    title "MyString"
    description "MyString"
    photo "MyString"
    gallery { |i| FactoryGirl.create(:gallery, user: i.user) }
    user
  end
end
