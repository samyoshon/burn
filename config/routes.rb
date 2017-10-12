Rails.application.routes.draw do
  # mount ImageUploader::UploadEndpoint => "/images/upload"
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions", :passwords => "users/passwords", :confirmations => "users/confirmations" }

  get '/users/profile', to: 'users#profile', as: 'user_profile'
  put '/users/profile', to: 'users#update_profile', as: 'user_update_profile'

  get '/users/advertisers', to: 'users#advertisers', as: 'user_advertisers'
  put '/users/advertisers', to: 'users#update_advertisers', as: 'user_update_advertisers'
  
  get '/users/products', to: 'users#products', as: 'user_products'
  put '/users/products', to: 'users#update_products', as: 'user_update_products'

  get '/users/flagged', to: 'users#flagged', as: 'user_flagged'
  put '/users/flagged', to: 'users#update_flagged', as: 'user_update_flagged'

  get '/users/forum_posts', to: 'users#forum_posts', as: 'user_forum_posts'
  
  get '/users/banners', to: 'users#banners', as: 'user_banners'
  post '/users/banners', to: 'users#update_banners', as: 'user_update_banners'
  
  resources :forum_threads, :path => 'community' do #url = community
    resources :forum_posts, module: :forum_threads
  end

  resources :markets, :path => 'marketplace' #url = marketplace

  get '', to: 'products#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  post '/products/flag', to: 'products#flag', as: 'product_flag'
  resources :products
  
  resources :users do
    collection do
      post :import
    end
  end

  root to: "markets#index"
end
