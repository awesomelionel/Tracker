FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@ticketee.com" }
    password "password"
    password_confirmation "password"
  end

  factory :project do
    name 'Digg'
  end

  factory :ticket do
    title "A ticket"
    description "A ticket, nothing more"
    user {|u| u.association(:user)}
    project {|p| p.association(:project)}
  end

end
