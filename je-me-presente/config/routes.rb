Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get '/home', to: 'static_pages#home', as: 'accueil'

  get '/contact', to: 'static_pages#contact', as: 'contact'

  get '/about(/:name)', to: 'static_pages#about', as: 'profil'

end
