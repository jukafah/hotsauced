include ActionDispatch::TestProcess

FactoryBot.define do
  factory :sauce do
    name { "Test name" }
    description { "Test description" }
    pepper { "Test pepper" }
    brand { "Test brand" }
    origin { "Test origin" }
    ingredients { "Test ingredients" }
    image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'placeholder_bottle.svg'), 'image/svg+xml') }
  end
end
