# frozen_string_literal: true
# require

class MessageMailer < ApplicationMailer
  require 'mailgun'

  def contact(message)
    @body = message.body
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {
      from: message.email,
      to: 'steve.momcilovic@gmail.com',
      subject: 'Contact - Hotsauced',
      text: message.body
    }
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
