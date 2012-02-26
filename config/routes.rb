Foodsearch::Application.routes.draw do

  resources :customers
  resources :sessions
  resources :providers, :only => [:show, :index]

  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  match '/results' => 'search_results#index', :as => 'search_results'
  root :to => 'index#index'

end
