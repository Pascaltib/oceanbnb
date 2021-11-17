class AddDateReservedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date_reserved, :date
  end
end
