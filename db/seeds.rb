# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
MovieTheater.destroy_all
MovieTheater.create!( :name => "LaunchPad Lab Friend",
                      :address_1 => "840 W Blackhawk St.",
                      :address_2 => "Apt 1407",
                      :city => "Chicago",
                      :state => "IL",
                      :zip => "60642",
                      :phone => "555-555-5555"
                    )


ScreeningRoom.destroy_all
6.times do |n|
  ScreeningRoom.create!(:theater_number => n + 1,
                        :seat_quantity => rand(100),
                        :movie_theater_id => 1)
end


def time_rand
  time_increments = [0,15,30,45]
  time = (Time.at(rand(0..7).days.from_now) + rand(-500..500).minutes).beginning_of_hour
  return time + time_increments.sample.minutes
end


Showing.destroy_all
ScreeningRoom.all.each do |room|
  10.times do
    Showing.create!(:time_slot => time_rand,
                    :seats_available => true,
                    :screening_room_id => room.id,
                    :movie_id => 2)
  end
end

Movie.destroy_all
Movie.create!(:name => "Ted 2",
              :rating => "R",
              :image_url => "http://t3.gstatic.com/images?q=tbn:ANd9GcSdyBLpMOpQNRmHVYBa3N1XanSp0K_RRkbJes7fOpQ78coBtYEQ",
              :length_in_minutes => 136,
              :genre => "Comedy",
              :description => "Thunder buddies for life.",
              :actors => "Mark Whalberg, Seth McFarland")


Ticket.destroy_all
Showing.all.each do |showing|
  showing.screening_room.seat_quantity.times do
    Ticket.create!( :ticket_type => "General Admission",
                    :price => 9.50,
                    :showing_id => showing.id)
  end
end

