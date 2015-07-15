class AddMovieIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :movie_id, :integer
  end
end
