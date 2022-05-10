Rails.application.routes.draw do
  devise_for :users
  #root 'home#index'
  # get "/blogs", to: "home/index"
  # get "/blogs/:id", to: "home/show"
  # get    "/articles/new" to:    "home#new"
  # get    "articles/:id"   to:  "home#show"
  # post   "/articles"        to:  "home#create
 
  # patch  "/articles/:id"    to:  "home#update"
  # delete "/articles/:id"
  #resources :blogs
  root 'blogs#index'
  resources :blogs do
    member do
      post :accept_reject
      post :aplly_user
     
    end
  end
end
