Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registerations: 'registerations'}
  
  # post 'users/create', to: 'users#create'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
