class TicketOffering < ActiveRecord::Base
  belongs_to :movie_theater
  has_many :tickets
end
