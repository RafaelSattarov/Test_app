TestFS::Application.routes.draw do
  
  resources :users 
  resources :events
  resources :sessions,      :only => [:new, :create, :destroy]
  
  match '/calendar(/:year(/:month(/:who)))' => 'calendar#index', :as => :calendar,
                  :constraints => {:year => /\d{4}/, :month => /\d{1,2}/, :who => /\d{1}/ }
 
  get "sessions/new"
  get "calendar/newevent"
  get "users/new"
  
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
 
  root :to => 'pages#home'

end
