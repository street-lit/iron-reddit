Rails.application.routes.draw do
  get     '/login',     to: 'sessions#new',        as: 'new_login'
  post    '/login',     to: 'sessions#create',     as: 'login'
  delete  '/logout',    to: 'sessions#destroy',    as: 'logout'

  resources :links
  resources :users

  post '/voteup/:link_id', to: 'votes#vote_up', as: 'vote_up'
  post '/votedown/:link_id', to: 'votes#vote_down', as: 'vote_down'

  root "links#index"
end
