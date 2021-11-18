class Yacht < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_one :ammenities, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


    include PgSearch::Model
  pg_search_scope :search_by,
    against: [ :name, :description, :location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
    #allows you to hit matches on half words
end
