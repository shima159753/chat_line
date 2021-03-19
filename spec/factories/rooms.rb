FactoryBot.define do
  factory :room do
    name              {'test'}
    association :user
  end
end
