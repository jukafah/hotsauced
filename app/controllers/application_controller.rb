# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @q = Sauce.ransack(params[:q])
  end
end
