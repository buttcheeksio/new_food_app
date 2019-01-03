Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes
  resources :ingredients

  get '/users/:id/recipe_search', to: 'users#search', as: 'recipe_search'
  get '/users/:id/my_account', to: 'users#search', as: 'my_account'

  root "recipes#index"
end
