Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'health', to: 'health#health'
  resources :categories
  resources :tasks do
    patch :trigger, on: :member
    resources :notes, only: [:create], controller: 'notes'
  end
  root to: 'tasks#index'
end
