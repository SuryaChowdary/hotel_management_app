Rails.application.routes.draw do
  root 'pages#home' 
  get 'about', to: 'pages#about'
  get 'signup' , to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users , except: [:new]
  resources :hotel_branches
  resources :rooms
  resources :clients
  resources :regions
  resources :locations
  resources :room_facility_categories
  resources :room_facilities
  #post 'clients/:id/add_hotels', to: 'clients#add_hotels', as: :add_hotels
  patch 'clients/:id/add_hotels', to: 'clients#add_hotels', as: 'add_hotels_client'

  resources :clients do
    member do
      post :add_hotels
    end
  end
  

end
