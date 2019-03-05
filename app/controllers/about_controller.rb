# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      format.html
      format.js
      if @contact.valid?
        @mailer = ContactMailer.new
        @response = @mailer.contact_email(@contact)
        render 'modal.js.erb'
      else
        @errors = @contact.errors
        render 'errors/validation_errors.js.erb', status: 422
      end
    end
  end

  def validate
    contact = Contact.new(contact_params)
    format_validation(contact, contact_params)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
