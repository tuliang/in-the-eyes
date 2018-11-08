Rails.application.routes.draw do

  resources :comments
  devise_for :users
  resources :images
  root to: "home#index"

  get '/pictures', to: 'home#pictures', as: 'pictures'
  get '/photos', to: 'home#photos', as: 'photos'
  get '/emoticons', to: 'home#emoticons', as: 'emoticons'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
