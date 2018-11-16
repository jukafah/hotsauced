# frozen_string_literal: true

class AboutController < ApplicationController
  def index; end

  def show
    respond_to do |format|
      format.js
    end
  end

  def contact
    @message = Message.new
    respond_to do |format|
      format.js
    end
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

  def contact_path
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
