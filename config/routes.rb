Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs do
    member do
      post :accept_reject
      post :aplly_user
     
    end
  end
end
