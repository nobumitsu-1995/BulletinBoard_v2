FactoryBot.define do
  factory :post do
    sequence(:content) { |i| "#{i}" }
    association :user
  end
end
