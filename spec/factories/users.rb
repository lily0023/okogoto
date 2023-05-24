# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  age              :integer          default("secret"), not null
#  crypted_password :string
#  email            :string           not null
#  gender           :integer          default("others"), not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
