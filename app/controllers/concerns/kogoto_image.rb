class KogotoImage
  require 'mini_magick'

  BASE_IMAGE_PATH = './app/assets/images/okogoto_kogoto.png'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '30,-70'.freeze
  FONT = './app/assets/fonts/kanjuku-Gothic.otf'.freeze
  FONT_SIZE = 75
  INDENTION_COUNT = 16
  ROW_LIMIT = 5

  def self.build(okogoto)
    text = prepare_text(okogoto)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill '#545454'
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
