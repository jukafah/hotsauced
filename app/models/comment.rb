# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :sauce
  validates :commenter, presence: true, length: { minimum: 1, maximum: 48 }
  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }
end
