# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @top_sauces = Sauce.order(rating: :desc).limit(5)
    @latest_sauce = Sauce.last
  end
end
