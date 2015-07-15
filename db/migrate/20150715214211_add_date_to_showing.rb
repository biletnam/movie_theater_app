class AddDateToShowing < ActiveRecord::Migration
  def change
    add_column :showings, :date, :date
  end
end
