Foodsearch::Application.routes.draw do

  resources :customers
  resources :sessions
  resources :providers, :only => [:show, :index]

  namespace :admin do
    resources :sessions, :only => [:new, :create, :destroy]
    resources :providers
    resources :translations, :only => [:index, :create]
  end

  namespace :extranet do
    resources :sessions, :only => [:new, :create, :destroy]
    resources :menus, :items, :ingredients
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

  get '/results' => 'search_results#index', :as => 'search_results'
  match 'cart/add/:id', to: 'order#add'
  match 'cart/remove/:id', to: 'order#remove'
  match 'cart/clear', to: 'order#clear'
  get 'cart', to: 'order#index'
  # match matches any http method/verb, while get matches only http method/verb GET.
  root :to => 'index#index'

end
