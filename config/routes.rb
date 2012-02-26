Foodsearch::Application.routes.draw do

  resources :customers
  resources :sessions
  resources :providers, :only => [:show, :index]

  namespace :admin do
    resources :providers
  end

  get 'admin', to: 'admin/index#index'
  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/results' => 'search_results#index', :as => 'search_results'
  # match matches any http method/verb, while get matches only http method/verb GET.
  root :to => 'index#index'

end
