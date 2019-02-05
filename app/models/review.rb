class Review < ApplicationRecord
  belongs_to :sauce
  validates :user, presence: true, length: { minimum: 1, maximum: 64 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :headline, presence: true, length: { minimum: 2, maximum: 64 }
  validates :body, presence: true, length: { minimum: 2, maximum: 1250 }
end
