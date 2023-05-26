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
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
