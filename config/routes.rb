Rails.application.routes.draw do

  namespace :admin do
    resources :games, only: [:index, :new, :create, :show]
  end
  namespace :public do
    resources :games, only: [:index, :show]
    resources :requests, only: [:create]
    get 'homes/top'
  end

  root "public/homes#top"
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
