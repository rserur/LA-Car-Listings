FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Mazda #{n}" }
    country "Japan"
  end
end
