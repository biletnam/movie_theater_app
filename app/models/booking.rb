class Booking < ActiveRecord::Base
  has_many :tickets
end
