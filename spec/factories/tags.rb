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
