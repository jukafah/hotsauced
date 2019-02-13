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
      format.html { puts "html" }
      format.js

      @contact.errors.add(:name)
      puts "@contact.errors: #{@contact.errors.key?('name')}"

      if !@contact.valid?
        # render inline: 'location.reload();'
        render 'errors.js.erb'
      else
        @mailer = ContactMailer.new
        @response = @mailer.contact_email(@contact)
        render 'modal.js.erb'
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end
end
