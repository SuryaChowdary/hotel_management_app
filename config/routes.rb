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
  patch 'clients/:id/add_hotels', to: 'clients#add_hotels', as: 'add_hotels_client'
  patch 'clients/:id/add_rooms', to: 'clients#add_rooms', as: 'add_rooms_client'
  patch 'clients/:id/add_room_facilities', to: 'clients#add_room_facilities', as: 'add_room_facilities_client'
  patch 'clients/:id/add_room_facility_categories', to: 'clients#add_room_facility_categories', as: 'add_room_facility_categories_client'
  #patch 'clients/:id/add_regions', to: 'clients#add_regions', as: 'add_regions_client'
  #patch '/clients/:id/add_location', to: 'clients#add_location', as: 'add_location_client'
  get '/locations_by_region', to: 'clients#locations_by_region', as: 'locations_by_region'


  # resources :clients do
  #   member do
  #     get :locations_by_region
  #   end
  # end


  

end
