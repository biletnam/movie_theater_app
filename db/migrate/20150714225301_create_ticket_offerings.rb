class CreateTicketOfferings < ActiveRecord::Migration
  def change
    create_table :ticket_offerings do |t|
      t.string :name
      t.decimal :price, :precision => 30, :scale => 10
      t.integer :movie_theater_id

      t.timestamps null: false
    end
  end
end
