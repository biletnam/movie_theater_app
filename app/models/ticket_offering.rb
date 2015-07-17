class TicketOffering < ActiveRecord::Base
  validates_presence_of :movie_theater, :name, :price
  belongs_to :movie_theater
  has_many :tickets
end
