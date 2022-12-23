Rails.application.routes.draw do

  namespace :admin do
    resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy ]
    resources :posts, only: [:show, :destroy]
    delete '/posts/:id/destroy_in_postshow' => 'posts#destroy_in_postshow', as: 'destroy_in_postshow'
    resources :comments, only: [:destroy]
    resources :users, only: [:index, :show, :destroy]
    patch '/users/:id/account_stop' => 'users#account_stop', as: 'account_stop'
    patch '/users/:id/account_start' => 'users#account_start', as: 'account_start'
    resources :requests, only: [:index, :destroy]
  end

  namespace :public do
    resources :games, only: [:index, :show] do
      resource :favorite_games, only: [:create, :destroy]
    end
    resources :requests, only: [:create]
    resources :posts, only: [:show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :comments, only: [:create, :destroy]
    get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
    resources :users, only: [:show, :edit, :update] do
      get :favorites
      resource :relationships, only: [:create, :destroy]
    end
    resources :messages, only: [:create]
    resources :rooms, only: [:create, :index, :show]
    get 'homes/top'
  end

  devise_scope :user do
    post 'public/users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  root "public/homes#top"

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
