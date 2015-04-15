Rails.application.routes.draw do

 

  get 'items/create'

  devise_for :users
  get 'welcome/index'

  resources :users, only: [:show] do 
    resources :items, only: [:create, :destroy]
  end
  

  root to:'users#show', as: :authenticated_root
end
