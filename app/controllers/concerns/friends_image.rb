class FriendsImage
  require 'mini_magick'

  BASE_IMAGE_PATH = './app/assets/images/okogoto_friends.png'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '320,-30'.freeze
  FONT = './app/assets/fonts/Senobi-Gothic-Regular.ttf'.freeze
  FONT_SIZE = 85
  INDENTION_COUNT = 10
  ROW_LIMIT = 7

  def self.build(okogoto)
    text = prepare_text(okogoto)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill '#FDD870'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
    image
  end

  def self.prepare_text(okogoto)
    okogoto.to_s.scan(/.{1,#{INDENTION_COUNT}}/o)[0...ROW_LIMIT].join("\n")
  end
end
