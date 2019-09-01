# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'name' }
    email { 'someone@somewhere.com' }
    body { 'What a super great website!' }
  end
end
