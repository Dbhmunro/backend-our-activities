Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities, only: [:index, :create]
  resources :categories, only: [:index]
  resources :activity_users, only: [:index, :create]
  resources :sessions, only: [:create]
  resources :users, only: [:create] do
    resources :activity_users, only: [:index]
  end
end
