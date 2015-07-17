class ScreeningRoom < ActiveRecord::Base
  validates_presence_of :movie_theater, :theater_number, :seat_quantity

  belongs_to :movie_theater
  has_many :showings
end
