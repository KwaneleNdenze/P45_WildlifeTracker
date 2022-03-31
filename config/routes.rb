Rails.application.routes.draw do

  root 'animals#index'

  get 'searchform', to: "sightings#searchform"
  get 'search', to: "sightings#search"
  get 'searchrange', to: "sightings#searchrange"
  resources :animals do
    resources :sightings
  end

  resources :regions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
