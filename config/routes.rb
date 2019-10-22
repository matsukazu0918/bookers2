Rails.application.routes.draw do
  get 'home/top' => 'homes#top'
  get 'home/about' => 'homes#about'
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:show, :edit, :create, :index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
