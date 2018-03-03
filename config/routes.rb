Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  resources :agencies, only: [:index, :show]

  root to: "agencies#index"

  namespace :admin do
    resources :agencies
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    root to: "agencies#index"
  end

  

end
