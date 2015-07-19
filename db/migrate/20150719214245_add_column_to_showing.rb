class AddColumnToShowing < ActiveRecord::Migration
  def change
    add_column :showings, :is_show_upcoming, :boolean, :default => true
  end
end
