Rails.application.routes.draw do
  get 'users/login' => 'users#login', as: 'login'
  post 'users/login' => 'users#check'
  resources :users
  resources :advertisements
  root 'advertisements#index'
  get '*path' => redirect('/')
end
