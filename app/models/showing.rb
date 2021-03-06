class Showing < ActiveRecord::Base
  default_scope { order('time_slot ASC') }
  scope :upcoming_shows, -> { where( is_show_upcoming: true ) }

  belongs_to :screening_room
  has_one :movie_theater, :through => :screening_room

  belongs_to :movie
  has_many :tickets
  has_many :bookings

  before_save :set_date

  def amount_of_seats_remaining
    self.screening_room.seat_quantity - self.tickets.count
  end

  def check_seat_availability
    if self.amount_of_seats_remaining <= 0
      self.seats_available = false
      self.save
    end
  end

  def set_date
    self.date = self.time_slot.to_date
  end

end
