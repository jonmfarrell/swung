Rails.application.routes.draw do
  # root "welcome/#index"
  resources :users, :only => [:index, :show]
  resources :teams, :only => [:show]
  resources :outings, :only => [:create]
end
