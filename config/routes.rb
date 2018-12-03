Rails.application.routes.draw do
  get 'feed/index', as: 'feed_index'
  resources :rewards

  resources :events do
    post 'likes/like_event', as: 'like'
  end

  devise_for :users
  resources :users

  resources :notices do
    post 'likes/like_notice', as: 'like'
  end

  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
