Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[create]
  resources :input, only: %i[index new create destroy]
  root to: 'input#new'
end
