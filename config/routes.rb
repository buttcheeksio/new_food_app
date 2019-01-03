Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :recipes
  resources :ingredients

  # get 'users/:id/cupboard', to: 'users#cupboard'
  # post 'users/:id/cupboard', to: 'users#cupboard'
  # patch 'users/:id/cupboard', to: 'users#update'

  # get 'users/:id/cupboard', to: 'user_ingredients#cupboard', as: 'cupboard'
  # get 'users/:id/cupboard/edit', to: 'user_ingredients#edit', as: 'cupboard_edit'

  root "recipes#index"
end
