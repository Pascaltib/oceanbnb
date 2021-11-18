class Yacht < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many :ammenities, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # include PgSearch::Model
  # multisearchable against: [:name, :description]
  # pg_search_scope :search_name_description,
  #                 against: [:name, :description],
  #                 using: { tsearch: {
  #                   prefix: true
    #allows you to hit matches on half words
  # }}
  # pg_search_scope :global_search,
  # against: [:name, :description, :location],
  # associated_against: { director: [
  #   :first_name, :last_name
  # ]},
  # using: { tsearch: {
  #   prefix: true
    ##allows you to hit matches on half words
  # }}
end
