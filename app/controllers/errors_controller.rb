# frozen_string_literal: true

class ErrorsController < ApplicationController
  def not_found
    render(status: 404)
  end

  def validate_sauce
    sauce = Sauce.new(sauce_validation_params)
    format_validation(sauce, sauce_validation_params)
  end

  def validate_review
    review = Review.new(review_validation_params)
    format_validation(review, review_validation_params)
  end

  def validate_contact
    contact = Contact.new(contact_validation_params)
    format_validation(contact, contact_validation_params)
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

  private

  def sauce_validation_params
    params.require(:sauce).permit(:name, :description, :pepper, :ingredients, :brand, :origin)
  end

  def review_validation_params
    params.require(:review).permit(:user, :headline, :body, :rating)
  end

  def contact_validation_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
