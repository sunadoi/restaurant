class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :menu
end
