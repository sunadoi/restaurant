class Payment < ApplicationRecord
  belongs_to :reservation, optional: true

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
