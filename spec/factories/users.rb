# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    username {Faker::Name.first_name+Faker::Name.first_name}
    password "secret"
  end
end
#
# FactoryGirl.define do
#   factory :moderator_table do
#     user_id 1
#     sub_id 1
#   end
# end
#
