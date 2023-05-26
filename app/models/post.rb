# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  comment      :text
#  kogoto_image :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :kogoto_image, OkogotoImageUploader

  validates :comment, length: { maximum: 1000 }
  validates :kogoto_image, presence: true
  validates :user_id, presence: true
end
