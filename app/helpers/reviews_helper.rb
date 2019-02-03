module ReviewsHelper

  def average_of(reviews)
    reviews.average(:rating).round(1)
  end

  def percent_of(reviews, rating)
    (reviews.where(rating: rating).count.to_f / reviews.count * 100).floor
  end
end
