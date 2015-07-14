class CreateScreeningRooms < ActiveRecord::Migration
  def change
    create_table :screening_rooms do |t|
      t.integer :theater_number
      t.integer :seat_quantity
      t.integer :movie_theater_id

      t.timestamps null: false
    end
  end
end
