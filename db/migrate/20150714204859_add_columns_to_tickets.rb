class AddColumnsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :showing_id, :integer
    add_column :tickets, :booking_id, :integer
  end
end
