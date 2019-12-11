class Reservation < ApplicationRecord
  belongs_to :payment
  belongs_to :menu

  validates :user_name, :reservation_date, :count, presence: true
  validates :count, numericality: { less_than_or_equal_to: 16,  only_integer: true }
end
