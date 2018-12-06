# frozen_string_literal: true

class Sauce < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 128 }
  validates :summary, presence: true, length: { minimum: 12, maximum: 1000 }
  validates :heat, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :flavor, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comments, presence: false
end
