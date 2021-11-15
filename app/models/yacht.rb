class Yacht < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many :ammenities, dependent: :destroy
end
