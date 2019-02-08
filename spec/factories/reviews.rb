FactoryBot.define do
  factory :review do
    user { "Test user" }
    headline { "A headline!" }
    body { "Test body" }
    rating { 1 }
    sauce { nil }
  end
end
