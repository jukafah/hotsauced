# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # @todo: need to base featured sauce off of something
    @sauces = [Sauce.first]
  end
end
