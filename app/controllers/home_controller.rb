# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ## TODO: reimplement top_sauces by user ratings
    # @top_sauces = Sauce.order(rating: :desc).limit(5)
    @top_sauces = Sauce.limit(5)
    @latest_sauce = Sauce.last
  end
end
