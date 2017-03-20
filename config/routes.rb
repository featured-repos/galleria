Rails.application.routes.draw do
  resources :photos
  resources :galleries do
    resources :photos
  end
  resources :users

  root 'marketing#index'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
  get '/dashboard' => 'dashboards#index'
  get '/galleries/:id/share' => 'galleries#share', as: :share
  post '/galleries/:id/share' => 'galleries#send_share'
  get '/galleries/:id/photos/:id/share' => 'photos#share', as: :share_photo
  post '/galleries/:id/photos/:id/share' => 'photos#send_share'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
