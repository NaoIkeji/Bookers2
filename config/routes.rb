Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  devise_for :users
  root'home#index'
  get "home/about" =>'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
    resources :book_comments, only: [:create,:edit, :update, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end

end
