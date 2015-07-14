class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :type
      t.decimal :price, :precision => 30, :scale => 10
      t.integer :showing_id

      t.timestamps null: false
    end
  end
end
