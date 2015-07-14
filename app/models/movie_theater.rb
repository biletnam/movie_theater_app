class MovieTheater < ActiveRecord::Base
  has_many :screening_rooms
  has_many :ticket_offerings
  has_many :showings, :through => :screening_rooms

  def movies
    movies = []
    self.showings.each do |showing|
      unless movies.include? Movie.find(showing.movie_id)
        movies << Movie.find(showing.movie_id)
      end
    end
    return movies
  end

end
