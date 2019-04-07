# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  include Authentication
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 128 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: true, length: { maximum: 32 }
end
