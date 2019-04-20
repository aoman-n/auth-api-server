FactoryBot.define do

  factory :admin_user, class: User do
    name { 'adminuser' }
    email { 'adminuser@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
    activated { true }
    activated_at { Time.zone.now }
  end

  factory :user do
    name { 'user' }
    email { 'user@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Time.zone.now }
  end

end