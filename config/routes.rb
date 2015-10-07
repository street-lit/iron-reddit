Rails.application.routes.draw do
  get 'sessions/new',     to: 'sessions#new',     as: 'new_login'
  get 'sessions/create',  to: 'sessions#create',  as: 'login'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'

  resources :votes
  resources :links
  resources :users

end
