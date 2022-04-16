Rails.application.routes.draw do
  devise_for :users
  get 'relationships/followings'
  get 'relationships/followers'
  resources :comics do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do

  end
  root to:'homes#top'
  get 'homes' => 'homes#top'
  get 'home/about' => 'homes#about'
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
      get :complete
    end
  end
end
