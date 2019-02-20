# frozen_string_literal: true

class Sauce < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: 1..128
  validates :description, presence: true, length: 12..2500
  validates :pepper, presence: true, length: 2..64
  validates :ingredients, presence: true, length: 4..500
  validates :brand, presence: true, length: 2..64
  validates :origin, presence: true, length: 2..64

  def self.reviewed
    includes(:reviews).where.not(reviews: { id: nil })
  end

  def average_rating
    reviews.average(:rating).round(1)
  end
end
