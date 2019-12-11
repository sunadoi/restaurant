class Reservation < ApplicationRecord
  belongs_to :payment
  belongs_to :menu
end
