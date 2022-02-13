Rails.application.routes.draw do
  resources :comics do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to:'homes#top'
  get 'homes' => 'homes#top'
  get 'home/about' => 'homes#about'
end
