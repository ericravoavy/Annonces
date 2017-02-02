Rails.application.routes.draw do
  resources :users
  resources :advertisements
  root 'advertisements#index'
  get '*path' => redirect('/')
end
