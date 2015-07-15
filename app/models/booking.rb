class Booking < ActiveRecord::Base
  has_many :tickets
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

    return @tickets
  end

  def movie
    self.tickets.first.showing.movie
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

end
