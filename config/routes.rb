Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'search#search'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:index, :create, :destroy]
    get 'follows', 'followers'
  end
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get '*anything' => 'homes#top'

end