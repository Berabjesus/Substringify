Rails.application.routes.draw do
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[create]
  resources :inputs, only: %i[index new create destroy]
  get '/:query', to: 'inputs#new'
  root to: 'inputs#new'
end
