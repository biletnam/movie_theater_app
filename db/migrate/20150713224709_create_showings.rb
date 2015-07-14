class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      t.datetime :time_slot
      t.boolean :seats_available
      t.integer :screening_room_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
