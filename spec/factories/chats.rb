FactoryBot.define do
  factory :chat do
    sentence              {'test'}
    association :user
    
  end
end
