# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n| 
  	"user#{n}@test.com"
  end
  sequence :password do |n|
    "password_#{n}_#{n}" 
  end

  factory :user, aliases: [:author, :performer] do
  	email
  	password
  end

  factory :current_user, class: :User do
    email
    password
  end
end
