Rails.application.routes.draw do

  root to: 'dashboard#index'

  get '/auth/github/callback' => 'sessions#create'
  delete '/sign_out' => 'sessions#destroy', as: :sign_out
  get '/auth/failure' => 'sessions#failure'

  resources :projects, except: :index

end
