FactoryGirl.define do
  factory :car do
    sequence(:name) { |n| "Protege #{n}" }
    description "The Mazda Familia, also marketed as the Mazda 323 and the Mazda Protegé, is a small family car that was manufactured by Mazda between 1963 and 2003."
    color "black"
    sequence(:year) { |n| "200#{n}" }
    mileage "12324"
  end
end
