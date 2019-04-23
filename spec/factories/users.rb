# == Schema Information
#
# Table name: users
#
#  id                :bigint(8)        not null, primary key
#  email             :string(255)      not null
#  name              :string(255)      not null
#  password_digest   :string(255)      not null
#  remember_digest   :string(255)
#  admin             :boolean          default(FALSE)
#  activation_digest :string(255)
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  reset_digest      :string(255)
#  reset_sent_at     :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

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

  factory :aoba, class: User do
    name {'aoba'}
    email {'aoba@example.com'}
    password {'password'}
    password_confirmation {'password'}
    activated {true}
    activated_at {Time.zone.now}
  end

end
