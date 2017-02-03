Rails.application.routes.draw do
  get 'users/login' => 'users#login', as: 'login'
  post 'users/login' => 'users#check'
  patch 'advertisements/publish/:id' => 'advertisements#publish'
  resources :users
  resources :advertisements do
    resources :comments
  end
  post 'advertisements/new' => 'advertisements#new'
  root 'advertisements#index'
  get '*path' => redirect('/')
end
