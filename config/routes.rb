Rails.application.routes.draw do
  get 'auth/create'

  post '/signup', to: 'signup#create'
  
  post '/auth/login', to: 'auth#login'
  get '/auth/logout', to: 'auth#logout'

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
