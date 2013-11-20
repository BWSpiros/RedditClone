# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    url "MyString"
    poster_id 1
    title "MyString"
    description "MyText"
  end
end
