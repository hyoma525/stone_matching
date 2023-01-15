Rails.application.routes.draw do
  get 'diagnoses/new'
  get 'diagnoses/index'
  resources :power_stones
  root 'power_stones#index'
  get 'posts/index'
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
