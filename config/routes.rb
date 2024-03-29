Foodsearch::Application.routes.draw do

  resources :customers, :has_many => :addresses
  resources :sessions
  resources :providers, :only => [:show, :index]
  resources :addresses

  namespace :admin do
    resources :sessions, :only => [:new, :create, :destroy]
    resources :providers
    resources :translations, :only => [:index, :create]
  end

  namespace :extranet do
    resources :sessions, :only => [:new, :create, :destroy]
    resources :menus, :items, :ingredients, :offices
  end

  get 'admin', to: 'admin/index#index'
  get 'extranet', to: 'extranet/index#index'
  get 'extranet/login', to: 'extranet/sessions#new'
  get 'extranet/logout', to: 'extranet/sessions#destroy'
  get 'admin/login', to: 'admin/sessions#new'
  get 'admin/logout', to: 'admin/sessions#destroy'
  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'account', to: 'customers#edit', as: 'account'
  get 'profile', to: 'customers#show', as: 'profile'
  get 'places/:id', to: 'providers#show', as: 'place'
  get 'places', to: 'providers#index', as: 'places'

  get '/results' => 'search_results#index', :as => 'search_results'
  match 'cart/add/:id', to: 'cart#add'
  match 'cart/remove/:id', to: 'cart#remove'
  match 'cart/clear', to: 'cart#clear'
  match 'cart/complete', to: 'cart#complete', :as => 'cart_complete'
  get 'cart', to: 'cart#index'
  # match matches any http method/verb, while get matches only http method/verb GET.
  root :to => 'index#index'

end
