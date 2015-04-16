Rails.application.routes.draw do

 


  devise_for :users
  resources :items
  
  get 'welcome/index'


  

  root to:'users#show', as: :authenticated_root
end
