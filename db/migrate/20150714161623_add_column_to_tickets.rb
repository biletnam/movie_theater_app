class AddColumnToTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :showing_id
    add_column :tickets, :movie_theater_id, :integer
  end
end
