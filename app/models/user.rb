# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  age              :integer          default(0), not null
#  crypted_password :string
#  email            :string           not null
#  gender           :integer          default(0), not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true

  validates :name, presence: true, length: { maximum: 225 }
  validates :age, presence: true
  validates :gender, presence: true
end
