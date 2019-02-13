# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      format.js
      if @contact.valid?
        @mailer = ContactMailer.new
        @response = @mailer.contact_email(@contact)
        render 'modal.js.erb'
      else
        puts "@contact.errors: #{@contact.errors.key?('name')}"

        @contact.errors.each do |error|
          puts "error: #{error}"
        end
        render 'errors.js.erb'
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
