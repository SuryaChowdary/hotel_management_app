Rails.application.routes.draw do
  root 'pages#home' 
  get 'about', to: 'pages#about'
  resources :hotel_branches
  resources :rooms
  resources :clients
  resources :regions
  resources :locations
  resources :room_facility_categories
  resources :room_facilities
end