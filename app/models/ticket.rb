class Ticket < ActiveRecord::Base
  belongs_to :ticket_offering
  belongs_to :booking
  belongs_to :showing
end
