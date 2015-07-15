class AddShowingIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :showing_id, :integer
  end
end
