Rails.application.routes.draw do

  namespace :admin do
    resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy ]
    resources :users, only: [:index, :show]
    resources :requests, only: [:index]
  end
  namespace :public do
    resources :games, only: [:index, :show]
    resources :requests, only: [:create]
    resources :posts, only: [:show, :create, :destroy]
    resources :comments, only: [:create]
    resources :users, only: [:show]
    resources :users do
      resource :relationships, only: [:create, :destroy]
    end
    get 'homes/top'
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root "public/homes#top"
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
