# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  comment      :text
#  kogoto_image :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tag_id       :bigint
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_tag_id   (tag_id)
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  mount_uploader :kogoto_image, OkogotoImageUploader

  validates :comment, length: { maximum: 1000 }
  validates :kogoto_image, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
