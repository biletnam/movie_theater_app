class Booking < ActiveRecord::Base
  has_many :tickets
  belongs_to :showing
  belongs_to :movie

  validates_presence_of :name, :email, :cc_number, :cc_cvc, :cc_exp_mon, :cc_exp_yr

  def create_tickets(tickets, showing_id)
    tickets.each do |k,v|
      v.to_i.times do
        Ticket.create!(
          :showing_id => showing_id,
          :booking_id => self.id,
          :ticket_offering_id => k.to_i
        )
      end
    end
    adjust_showing_seating
  end

  def movie
    self.tickets.first.showing.movie
  end

  def adjust_showing_seating
    puts self.tickets.first.showing
    self.tickets.first.showing.check_seat_availability
  end

  def ticket_type_hash
    ticket_types = Hash.new 0
    self.tickets.each do |ticket|
      ticket_types[ticket.ticket_offering.name] += 1
    end
    return ticket_types
  end

  def set_total_cost
    total_cost = 0
    self.tickets.each do |ticket|
      total_cost += ticket.ticket_offering.price
    end
    self.total_cost = total_cost
    save
    return total_cost
  end

  def set_movie_id
    self.movie_id = self.showing.movie_id
    save
  end

end
