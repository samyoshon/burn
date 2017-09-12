Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images/upload"
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords", :confirmations => "users/confirmations" }
  
  resources :forum_threads, :path => 'community' do #url = community
    resources :forum_posts, module: :forum_threads
  end

  resources :markets, :path => 'marketplace' #url = marketplace

  # resources :products, module: :markets do
  resources :products do
    resources :images
    # collection do
    #   match 'search' => 'product#search', via: [:get, :post], as: :search
    # end
  end 

  get '/users/profile', to: 'users#profile', as: 'user_profile'
  put '/users/profile', to: 'users#update_profile', as: 'user_update_profile'
  get '/users/products', to: 'users#products', as: 'user_products'
  put '/users/products', to: 'users#update_products', as: 'user_update_products'
  get '/users/forum_posts', to: 'users#forum_posts', as: 'user_forum_posts'
  
  resources :users do
    collection do
      post :import
    end
  end

  root to: "products#index"
end
