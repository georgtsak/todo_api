Rails.application.routes.draw do

  post '/signup', to: 'users#create'
  post '/auth/login', to: 'sessions#create'
  get '/auth/logout', to: 'sessions#destroy'
  resources :todos do
    resources :todo_items, shallow: true
  end
end
