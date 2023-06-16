require 'rails_helper'

RSpec.describe OkogotoImage, type: :model do
  describe 'オコゴト画像の作成' do
    it 'オコゴトが入力されていない時、オコゴト画像が生成されない' do
      okogoto_image_without_okogoto = build(:okogoto_image, :kakugen, okogoto: '')
      expect(okogoto_image_without_okogoto).to be_invalid
      expect(okogoto_image_without_okogoto.errors[:okogoto]).to eq ['を入力してください']
    end
  end
end
