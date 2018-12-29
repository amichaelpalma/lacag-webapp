Rails.application.routes.draw do

  # Pages
  get '/about', to: "pages#about"
  get '/seminarsandtrainings', to: "pages#seminarsandtrainings"
<<<<<<< HEAD
  get '/secret', to: "pages#secret"
  get '/donate', to: "pages#donate"
=======

>>>>>>> 8-add-list-for-seminarsandtrainings-request

  #Request for Seminar and Training
  resources 'requests'

  # Root
  root 'pages#home'

  # Donations
  resources 'donations'

  # Users
  resources 'users'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Volunteers
  resources 'volunteers'

  # Events
  resources 'events'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
