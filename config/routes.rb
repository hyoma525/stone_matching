Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registritions: 'users/registrations'
  }
  resources :users, only: [:show]
  get 'diagnoses/new'
  get 'diagnoses/index'
  resources :power_stones, shallow: true do
    collection do
      get :have_stones
    end
    collection do
      get :want_stones
    end
  end
  resources :have_stones, only: %i[create destroy]
  resources :want_stones, only: %i[create destroy]
  root 'tops#index'
  get 'posts/index'

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
