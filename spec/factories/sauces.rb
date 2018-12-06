include ActionDispatch::TestProcess

FactoryBot.define do
  factory :sauce do
    name { "Test name" }
    summary { "Test summary" }
    heat { 1 }
    flavor { 1 }
    rating { 1 }
    image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'hotsauce_stock.jpg'), 'image/jpg') }
  end
end
