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
        render 'errors.js.erb'
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
