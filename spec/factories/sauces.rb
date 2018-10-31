FactoryBot.define do
  factory :sauce do
    name { "Test name" }
    summary { "Test summary" }
    heat { 1 }
    flavor { 1 }
    rating { 1 }
    image { "some/image/" }
  end
end
