Rails.application.routes.draw do

  resources :images
  root to: "home#index"

  get '/pictures', to: 'home#pictures', as: 'pictures'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
