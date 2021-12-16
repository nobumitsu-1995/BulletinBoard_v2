FactoryBot.define do
  factory :user do
    provider {"test"}
    sequence(:uid) { |i| "user_id#{i}" }
    sequence(:name) { |i| "user#{i}" }
    avatar { "MyString" }
  end
end
