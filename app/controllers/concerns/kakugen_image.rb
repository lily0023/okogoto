class KakugenImage
  require 'mini_magick'

  BASE_IMAGE_PATH = './app/assets/images/okogoto_kakugen.png'.freeze
  GRAVITY = 'center'
  TEXT_POSITION = '0,-10'
  FONT = './app/assets/fonts/Harenosora.otf'.freeze
  FONT_SIZE = 80
  INDENTION_COUNT = 16
  ROW_LIMIT = 5

  def self.build(okogoto)
    text = prepare_text(okogoto)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|        
      config.font FONT
      config.fill '#FFFFFF'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
    return image
  end

  private
  def self.prepare_text(okogoto)
    okogoto.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end
