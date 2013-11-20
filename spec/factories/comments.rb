# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content "MyText"
    poster_id 1
    parent_id 1
    link_id 1
  end
end
