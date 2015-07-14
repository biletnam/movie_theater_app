class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.string :cc_number
      t.string :cc_cvc
      t.string :cc_exp_mon
      t.string :cc_exp_yr
      t.boolean :buyer_age_confirmed
      t.string :total_cost

      t.timestamps null: false
    end
  end
end
