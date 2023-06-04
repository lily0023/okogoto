class KakugenImage
  require 'mini_magick'

  BASE_IMAGE_PATH = './app/assets/images/okogoto_kakugen.png'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '0,-10'.freeze
  FONT = './app/assets/fonts/Harenosora.otf'.freeze
  FONT_SIZE = 80
  INDENTION_COUNT = 16
  ROW_LIMIT = 5
  BETWEEN_LINES = 4

  def self.build(okogoto)
    text = prepare_text(okogoto)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill '#FFFFFF'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
      config.interline_spacing BETWEEN_LINES
    end
    image
  end

  def self.prepare_text(okogoto)
    okogoto.to_s.scan(/.{1,#{INDENTION_COUNT}}/o)[0...ROW_LIMIT].join("\n")
  end
end
