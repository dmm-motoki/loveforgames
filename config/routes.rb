Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end

  root "public/homes#top"
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
