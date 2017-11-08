Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/edit'

  get 'sessions/update'

  devise_for :moussaillons
  get 'home/index'
  get 'moussaillons/sign_out', to: 'sessions#destroy'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
