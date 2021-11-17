class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht

  validates :user_id, uniqueness: { scope: :yacht_id }
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
