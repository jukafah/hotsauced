FactoryBot.define do
  factory :user do
    username { "Username" }
    email { "someone@somewhere.com" }
    password { "password" }
  end
end
