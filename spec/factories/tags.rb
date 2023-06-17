# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  situation  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :tag do
    trait :study do
      situation{'学習'}
    end

    trait :others do
      situation{'その他'}
    end
  end
end
