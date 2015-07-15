class AddTotalCostToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :total_cost
    add_column :bookings, :total_cost, :decimal, :precision => 30, :scale => 10
  end
end
