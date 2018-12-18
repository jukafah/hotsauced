# frozen_string_literal: true

class ContactController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    MessageMailer.contact(@message).deliver_now
    redirect_to contact_path
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
