# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  require 'mailgun'

  # def contact(message)
  #   @body = message.body
  #   mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
  #   message_params = {
  #     from: message.email,
  #     to: 'steve.momcilovic@gmail.com',
  #     subject: 'Contact - Hotsauced',
  #     text: message.body
  #   }
  #   mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  # end

  def contact_email(message)
    mg_client = Mailgun::Client.new("96c8f262aef081fcf4941fec2cf8249d-9525e19d-32935fc4", "bin.mailgun.net", "9c34b089", ssl = false)

    message_params = {
      from: %("#{message.name}" <#{message.email}>),
      to: 'steve.momcilovic@gmail.com',
      subject: "Contact - Hotsauced",
      text: message.body
    }

    result = mg_client.send_message("sandboxd664eb524fde4830b3f63d9bf34830b2.mailgun.org", message_params)
    result
  end
end
