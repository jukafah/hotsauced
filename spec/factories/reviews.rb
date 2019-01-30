FactoryBot.define do
  factory :review do
    user { "Test user" }
    body { "Test body" }
    rating { 1 }
    sauce { nil }
  end
end
