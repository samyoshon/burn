Rails.application.routes.draw do
  devise_for :users

  resources :forum_threads, :path => 'forums' do
    resources :forum_posts, module: :forum_threads
  end

  resources :markets, :path => 'marketplace'

  # resources :products, module: :markets do
  resources :products do
    collection do
      match 'search' => 'product#search', via: [:get, :post], as: :search
    end
  end 

  resources :users do
    collection do
      post :import
    end
  end

  root to: "forum_threads#index"
end
