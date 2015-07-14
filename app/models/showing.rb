class Showing < ActiveRecord::Base
  default_scope { order('time_slot ASC') }

  belongs_to :screening_room
  has_one :movie
end
