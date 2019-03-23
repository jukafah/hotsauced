# frozen_string_literal: true

class User < ApplicationRecord
  include BCrypt
  attr_accessor :remember_token
  has_secure_password
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 128 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: true, length: { maximum: 32 }

  def remember
    @token = SecureRandom.urlsafe_base64
    self.remember_token = Password.create(@token)
    update_attribute(:remember_digest, remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
