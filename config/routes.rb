Rails.application.routes.draw do

 

  devise_for :users
  get 'welcome/index'

  resources :users, only: [:show] do 
  end
  

  root to:'users#show', as: :authenticated_root
end
