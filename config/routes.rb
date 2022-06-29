Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :expenses, only: [:new, :create, :destroy]
  end

  # Defines the root path route ("/")
  root 'categories#index'
end
