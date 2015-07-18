require 'credit_card_validator'

class Booking < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  has_many :tickets
  belongs_to :showing
  belongs_to :movie

  validates_presence_of :name, :email, :cc_cvc
  validates :email, :email => true
  validate :cc_format
  validate :cc_expiration_date
  validate :buyer_aged_confirmed

  before_save :set_movie_id, :set_last_4_digits

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
    set_total_cost
  end

  def adjust_showing_seating
    self.showing.check_seat_availability
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
    self.save(:validate => false)
  end

  def set_movie_id
    self.movie_id = showing.movie_id
  end

  def set_last_4_digits
    self.cc_number = self.cc_number[-4..-1]
  end

  def cc_format
    # just to use test numbers in production
    CreditCardValidator::Validator.options[:test_numbers_are_valid] = true

    unless CreditCardValidator::Validator.valid?(self.cc_number)
      errors.add(:cc_number, "Credit card number is not valid. Please re-enter")
    end
  end

  def cc_expiration_date
    exp_date = self.cc_exp_yr + self.cc_exp_mon

    unless exp_date.to_i > Date.current.strftime("%Y%m").to_i
      errors.add(:cc_exp_yr, "Credit card is expired. Please use a different card.")
    end
  end

  def buyer_aged_confirmed
    if self.movie.rating == "R" && self.buyer_age_confirmed == false
      errors.add(:buyer_age_confirmed, "This movie is rated R. You must confirm your age.")
    end
  end

end
