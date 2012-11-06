# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :story do
    title "Story title"
    association :author
    association :performer
  end
end
