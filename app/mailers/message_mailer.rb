# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  def contact(message)
    Mail.deliver do
      from message.email
      to 'steve.momcilovic@gmail.com'
      subject 'HOT SAUCED: Contact'
      body message.body
    end
  end
end
