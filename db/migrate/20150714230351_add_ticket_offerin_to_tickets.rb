class AddTicketOfferinToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :ticket_offering_id, :integer
    remove_column :tickets, :movie_theater_id
    remove_column :tickets, :ticket_type
    remove_column :tickets, :price
  end
end
