# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
MovieTheater.destroy_all
MovieTheater.create!( :name => "Movie Theater for LaunchPad Lab Friend",
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
                        :movie_theater_id => MovieTheater.first.id)
end


def time_rand
  time_increments = [0,15,30,45]
  time = (Time.at(rand(0..7).days.from_now) + rand(-500..500).minutes).beginning_of_hour
  return time + time_increments.sample.minutes
end



Movie.destroy_all
Movie.create!(:name => "Ted 2",
              :rating => "R",
              :image_url => "http://t3.gstatic.com/images?q=tbn:ANd9GcSdyBLpMOpQNRmHVYBa3N1XanSp0K_RRkbJes7fOpQ78coBtYEQ",
              :length_in_minutes => 136,
              :genre => "Comedy",
              :description => "Thunder buddies for life.",
              :actors => "Mark Whalberg, Seth McFarland")

Movie.create!(:name => "Jurassic World",
              :rating => "PG-13",
              :image_url => "http://images.fandango.com/r97.1/ImageRenderer/164/250/redesign/static/img/default_poster.png/0/images/masterrepository/fandango/174160/jurassicworldposternew.jpg",
              :length_in_minutes => 110,
              :genre => "Action",
              :description => "Steven Spielberg returns to executive produce the long-awaited next installment of his groundbreaking Jurassic Park series, Jurassic World. Colin Trevorrow directs the epic action-adventure from a screenplay he wrote with Derek Connolly.",
              :actors => "Chris Pratt")


Showing.destroy_all
ScreeningRoom.all.each do |room|
  10.times do
    Showing.create!(:time_slot => time_rand,
                    :seats_available => true,
                    :screening_room_id => room.id,
                    :movie_id => Movie.all.pluck(:id).sample)
  end
end

Ticket.destroy_all
Ticket.create!( :ticket_type => "General Admission",
                :price => 9.50,
                :movie_theater_id => MovieTheater.first.id)


theater_count = MovieTheater.count
sr_count = ScreeningRoom.count
movies_count = Movie.count
showings_count = Showing.count
tickets_count = Ticket.count

puts "#{theater_count} movie theaters were created"
puts "#{sr_count} screening rooms were created"
puts "#{movies_count} movies were created"
puts "#{showings_count} showings were created"
puts "#{tickets_count} tickets were created"

