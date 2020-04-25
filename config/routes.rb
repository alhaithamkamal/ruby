Rails.application.routes.draw do
  get 'sessions/login', to: 'sessions#login'
  post 'sessions/login', to: 'sessions#login_attempt'
  post 'sessions/logout', to: 'sessions#logout'
  # get 'sessions/home,'
  # get 'sessions/profile,'
  # get 'sessions/setting'
  # get 'users/new'
  post 'users/create', to: 'users#create'
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
