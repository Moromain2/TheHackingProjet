Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'course#home'

  get '/courses', to: 'course#courses'
  get '/lessons', to: 'course#lessons'

  resources :courses

end
