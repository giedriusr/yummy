Foodsearch::Application.routes.draw do

  match '/results' => 'search_results#index', :as => 'search_results'
  root :to => 'index#index'

end
