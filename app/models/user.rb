# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  age                                 :integer          default("secret"), not null
#  crypted_password                    :string
#  email                               :string           not null
#  gender                              :integer          default("others"), not null
#  name                                :string           not null
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string
#  reset_password_token_expires_at     :datetime
#  role                                :integer          default(0), not null
#  salt                                :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token)
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true

  validates :name, presence: true, length: { maximum: 225 }
  validates :age, presence: true
  validates :gender, presence: true

  enum age: { secret: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, older: 5 }
  enum gender: { others: 0, male: 1, female: 2 }
  enum role: { general:0, admin:1 }

  def like_post?(post)
    like_posts.include?(post)
  end
end
