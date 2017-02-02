Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

  get 'advertisements/create'

  get 'advertisements/update'

  get 'advertisements/destroy'

  get 'advertisements/edit'

  get 'users/new'

  get 'users/login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
