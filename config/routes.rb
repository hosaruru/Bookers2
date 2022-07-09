Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  get "home/about" => "home#about", as: "about"
  get "/users" => "users#index"
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  end
  resources :users, only: [:show, :edit, :update, :new, :create]
end



