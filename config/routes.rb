Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users
  root to: 'sessions#new'
end
