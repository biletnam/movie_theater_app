class AddColumnTicketTypeToTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :type, :string
    add_column :tickets, :ticket_type, :string
  end
end
