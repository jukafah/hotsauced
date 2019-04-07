# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern
  include BCrypt

  included do
    has_secure_password
  end

  def remember
    @token = SecureRandom.urlsafe_base64
    self.remember_token = Password.create(@token)
    update_attribute(:remember_digest, remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  module ClassMethods
    def authenticate(email, password)
      user = find_by_email(email)
      return user if user&.authenticate(password)
      user = User.new
      user.errors.add(:invalid, 'Sign in failed. Your email and password do not match')
      user
    end
  end
end
