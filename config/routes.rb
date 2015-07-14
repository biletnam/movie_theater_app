Rails.application.routes.draw do
  resources :bookings

  root to: "movie_theaters#show"

  resources :tickets

  resources :movies

  resources :showings

  resources :screening_rooms

  resources :movie_theaters
    get '/manage_theater_dashboard/:id',  :as => :theater_dashboard,
                                          :controller => :movie_theaters,
                                          :action => :dashboard

end
