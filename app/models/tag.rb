# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  situation  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :posts

  validates :situation, presence: true
end
