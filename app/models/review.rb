class Review < ApplicationRecord
  belongs_to :sauce
  validates :user, presence: true, length: { minimum: 1, maximum: 64 }
  validates :rating, presence: true, length: 1..5
  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }
end
