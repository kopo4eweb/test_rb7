Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/data', to: 'movies#data'
  post 'movies/load', to: 'movies#load'

  root to: 'movies#index'
end
