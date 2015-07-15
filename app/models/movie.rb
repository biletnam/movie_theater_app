class Movie < ActiveRecord::Base
  has_many :showings
  has_many :theaters
  has_many :bookings
end
