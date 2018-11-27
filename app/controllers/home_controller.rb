# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # @todo: need to base featured sauce off of something
    # @sauces = [Sauce.first]
    @sauces = Sauce.order(heat: :desc)[0..4]
    @latest_sauce = Sauce.first
  end
end
