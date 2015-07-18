class ChangeColumnBuyerAgeBookings < ActiveRecord::Migration
  def change
    change_column :bookings, :buyer_age_confirmed, :boolean, :default => false
  end
end
