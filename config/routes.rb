Rails.application.routes.draw do
  get 'login/create'
  get 'login/destroy'
  post '/signup', to: 'signup#create'
  post '/auth/login', to: 'sessions#create'
  get '/auth/logout', to: 'sessions#destroy'



  resources :todos do
    resources :todo_items, shallow: true
  end

  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'


  post '/todos/:todo_id/items', to: 'todo_items#create'
  get '/todos/:todo_id/items/:id', to: 'todo_items#show'

  put '/todos/:todo_id/items/:id', to: 'todo_items#update'
  delete '/todos/:todo_id/items/:id', to: 'todo_items#destroy'

  

end
