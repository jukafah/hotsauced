# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  require 'mailgun'

  def contact(message)
    # mailgun_client = Mailgun::Client.new ENV['mailgun_secret_api_key']
    mailgun_client = Mailgun::Client.new '96c8f262aef081fcf4941fec2cf8249d-9525e19d-32935fc4'

    message_params = {
      from: message.email,
      to: 'steve.momcilovic@gmail.com',
      subject: 'HOT SAUCED: Contact',
      text: message.body
    }

    mailgun_client.send_message 'mg.hotsauced.herokuapp.com', message_params
    # mailgun_client.send_message ENV['mailgun_domain'], message_params
  end
end
