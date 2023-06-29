class MobileWallpaperCreator
  require 'mini_magick'

  BASE_IMAGE_PATH = './app/assets/images/July_mobile_paper.png'.freeze

  def self.build(okogoto_image)
    base_image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image = MiniMagick::Image.open(okogoto_image.url)
    okogoto_image = image.resize '864x613'
    result = base_image.composite(okogoto_image) do |c|
      c.compose 'Over'
      c.gravity 'NorthWest'
      c.geometry '+110+300'
    end
    result
  end
end
