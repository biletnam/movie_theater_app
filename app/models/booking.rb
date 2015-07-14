class Booking < ActiveRecord::Base
  has_many :tickets

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

end
