class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht

  validates :user_id, uniqueness: { scope: :yacht_id }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
