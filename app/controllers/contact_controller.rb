# frozen_string_literal: true

class ContactController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to about_contact
      flash[:notice] = 'Thank you for your message!'
    else
      flash[:notice] = 'There was an error sending your message. Please try again.'
      render '_contact'
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
