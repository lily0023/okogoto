# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  age                                 :integer          default(0), not null
#  crypted_password                    :string
#  email                               :string           not null
#  gender                              :integer          default(0), not null
#  name                                :string           not null
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string
#  reset_password_token_expires_at     :datetime
#  salt                                :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token)
#
FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "user_#{n}@example.com" }
    name{ 'user' }
    age { :twenties }
    gender { :female }
    password {'password'}
    password_confirmation{'password'}
  end
end
