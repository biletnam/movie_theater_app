class ScreeningRoom < ActiveRecord::Base
  belongs_to :movie_theater
  has_many :showings
end
