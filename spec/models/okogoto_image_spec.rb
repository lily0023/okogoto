require 'rails_helper'

RSpec.describe OkogotoImage, type: :model do
  describe 'オコゴト画像の作成' do
    it 'オコゴトが入力されていない時、オコゴト画像が生成されない' do
      expect(OkogotoImage.new(okogoto: nil)).to eq
    end 
  end
end
