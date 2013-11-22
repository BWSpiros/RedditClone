Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.username {Faker::Name.first_name+Faker::Name.first_name}
  f.password "secret"
end
