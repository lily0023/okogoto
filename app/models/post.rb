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

  scope :search_tag, -> (tag){ tag.present? ? where(tag_id: tag) : all }
  scope :include, -> { includes(:user, :tag, :likes) }
  scope :recent, -> { order(created_at: :desc) }

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def okogoto_image_data
    URI.open("https://okogoto.s3.ap-northeast-1.amazonaws.com/#{self.kogoto_image.path}", 'r')
  end
end
