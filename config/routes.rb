Rails.application.routes.draw do
  resources :bookings

  root to: "movie_theaters#index"

  resources :tickets

  resources :movies

  resources :showings

  resources :screening_rooms

  resources :movie_theaters
end
