class AddPhotoToMovieTheater < ActiveRecord::Migration
  def change
    add_column :movie_theaters, :image_url, :string
  end
end
