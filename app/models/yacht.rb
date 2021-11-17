class Yacht < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many :ammenities, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
