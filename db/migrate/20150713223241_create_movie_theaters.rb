class CreateMovieTheaters < ActiveRecord::Migration
  def change
    create_table :movie_theaters do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps null: false
    end
  end
end
