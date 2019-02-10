# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    MessageMailer.contact(@message).deliver_now
    redirect_to about_path
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
