Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes
  resources :ingredients

  get '/users/:id/recipe-search', to: 'users#search'

  root "recipes#index"
end
