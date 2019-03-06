# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @q = Sauce.ransack(params[:q])
  end

  def format_validation(model, params)
    model.valid?
    field = params.keys.first.try(:to_sym)
    is_valid = !model.errors.include?(field)
    error_message = model.errors[field].join(' and ').prepend("#{field} ").concat('.').capitalize
    respond_to do |format|
      format.json { render json: { field_name: field, valid: is_valid, message: error_message } }
    end
  end
end
