class RemoveDateReservedFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date_reserved
  end
end
