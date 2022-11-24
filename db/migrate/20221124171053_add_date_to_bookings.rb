class AddDateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_time, :date
  end
end
