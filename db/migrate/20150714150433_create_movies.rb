class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :rating
      t.string :image_url
      t.integer :length_in_minutes
      t.string :genre
      t.text :description
      t.string :actors

      t.timestamps null: false
    end
  end
end
