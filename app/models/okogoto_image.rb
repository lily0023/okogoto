class OkogotoImage
  include ActiveModel::Model

  attr_accessor :okogoto, :image

  validates :okogoto, presence: true, length: { maximum: 70 }
  validates :image, presence: true

  def composite_text_and_image(okogoto: self.okogoto, image: self.image)
    case image
    when 'kakugen'
      KakugenImageCreator.build(okogoto)
    when 'kogoto'
      KogotoImageCreator.build(okogoto)
    when 'friends'
      FriendsImageCreator.build(okogoto)
    end
  end
end
