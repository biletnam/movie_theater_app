class Showing < ActiveRecord::Base
  default_scope { order('time_slot ASC') }

  belongs_to :screening_room
  has_many :tickets

  def amount_of_seats_remaining
    self.screening_room.seat_quantity - self.tickets_sold
  end

  def tickets_sold
    self.tickets.count
  end

  def movie
    Movie.find(self.movie_id)
  end

end
