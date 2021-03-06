# frozen_string_literal: true

module SaucesHelper
  def default_image?(sauce)
    if sauce.image.attached?
      sauce.image
    else
      'placeholder_bottle.svg'
    end
  end

  def top_sauces
    @top_sauces = Sauce.reviewed.sort_by(&:average_rating).reverse!
    @top_sauces.first 5
  end

  def latest_sauce
    @latest_sauce = Sauce.last
  end

  def render_sauces
    if !@sauces.empty?
      render 'sauces'
    else
      render 'no_results'
    end
  end
end
