class ChangeStatusOfBookings < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:bookings, :status, from: "pending", to: "Pending")
  end
end
