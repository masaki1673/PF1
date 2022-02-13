Rails.application.routes.draw do
  resources :comics
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root to:'homes#top'
  get 'homes' => 'homes#top'
  get 'home/about' => 'homes#about'
end
