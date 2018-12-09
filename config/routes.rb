Rails.application.routes.draw do

  # Pages
  root 'pages#home'
  get '/about', to: "pages#about"

  # Root
  root 'donations#index'

  # Donations
  resources 'donations'

  # Users
  resources 'users'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
