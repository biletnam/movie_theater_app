class Showing < ActiveRecord::Base
  default_scope { order('time_slot ASC') }

  belongs_to :screening_room

  def amount_of_seats_remaining
    self.screening_room.seat_quantity - self.tickets_sold
  end

  def tickets_sold
    0
  end

  def movie
    Movie.find(self.movie_id)
  end

end
