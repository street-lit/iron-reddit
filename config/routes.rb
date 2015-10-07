Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'

  resources :votes
  resources :links
  resources :users
end
