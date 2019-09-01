# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    # user { "Test user" }
    sequence(:user) { |n| "User #{n}" }
    headline { 'A headline!' }
    body { 'Test body' }
    rating { rand(1..5) }
    sauce { nil }
  end
end
