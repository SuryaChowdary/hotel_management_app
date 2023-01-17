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
  patch 'clients/:id/add_rooms', to: 'clients#add_rooms', as: 'add_rooms_client'
  patch 'clients/:id/add_room_facilities', to: 'clients#add_room_facilities', as: 'add_room_facilities_client'
  patch 'clients/:id/add_room_facility_categories', to: 'clients#add_room_facility_categories', as: 'add_room_facility_categories_client'
  #patch 'clients/:id/add_region_and_locations', to: 'clients#add_region_and_locations', as: :add_region_and_locations_client
  patch 'locations_by_region/:region_id' , to: 'clients#locations_by_region', as: 'locations_by_region_client'
  resources :clients do
    member do
      get :locations_by_region
    end
  end


  

end
