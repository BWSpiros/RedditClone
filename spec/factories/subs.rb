# Read about factories at https://github.com/thoughtbot/factory_girl

subs = ['Word News','Tech','Funny','Porn','Spacedicks','WTF','Gentlemanboners','German','Makes4chanlooktame']
sub_owners = [1,3,6,22,44,44,98,15,44,2]
FactoryGirl.define do
  factory :sub do
    owner_id sub_owners.sample
    name subs.pop
  end
end