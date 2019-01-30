FactoryBot.define do
  factory :review do
    user { "MyString" }
    body { "MyText" }
    rating { 1 }
    sauce { nil }
  end
end
