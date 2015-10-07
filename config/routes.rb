Rails.application.routes.draw do
  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'

  resources :votes
  resources :links
  resources :users

  root "links#index"
end
