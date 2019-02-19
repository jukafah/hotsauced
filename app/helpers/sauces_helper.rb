# frozen_string_literal: true

module SaucesHelper
  def default_image?(sauce)
    return 'placeholder_bottle.svg' if !sauce.image.attached? else sauce.image
  end

  def render_sauces
    if !@sauces.empty?
      render 'sauces'
    else
      render 'no_results'
    end
  end
end
