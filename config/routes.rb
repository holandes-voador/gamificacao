Rails.application.routes.draw do
  resources :rewards
  resources :events
  devise_for :users
  resources :users
  resources :notices

  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
