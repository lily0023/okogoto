FactoryBot.define do
  factory :okogoto_image do
    okogoto{'okogoto'}

    trait :kakugen do
      image{'kakugen'}
    end

    trait :kogoto do
      image{'kogoto'}
    end

    trait :friendes do
      image{'friends'}
    end
  end
end
