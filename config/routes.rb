Rails.application.routes.draw do
  get 'feed/index', as: 'feed_index'
  resources :rewards

  resources :events do
    post 'likes/like_event', as: 'like'
    post 'comments/create', as: 'new_comment'
    post 'checkins/create', as: 'new_checkin'
    get 'checkins/list', as: 'list_checkins'
    post 'checkins/check_presence', as: 'presence_checkin'
  end

  devise_for :users
  resources :users

  resources :notices do
    post 'likes/like_notice', as: 'like'
    post 'comments/create', as: 'new_comment'
  end

  get 'ranks/users_rank', as: 'users_rank'

  root to: 'feed#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
