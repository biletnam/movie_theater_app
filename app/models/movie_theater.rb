class MovieTheater < ActiveRecord::Base
  has_many :screening_rooms

  has_many :showings, :through => :screening_rooms
  has_many :movies, :through => :showings
  has_many :bookings, :through => :showings
  has_many :tickets_sold, :through => :bookings, :source => :tickets

  has_many :ticket_offerings

  def revenue
    self.bookings.sum(:total_cost)
  end

  def movies
  end

end
