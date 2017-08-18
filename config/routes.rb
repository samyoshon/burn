Rails.application.routes.draw do
  devise_for :users

  resources :forum_threads, :path => 'forums' do
    resources :forum_posts, module: :forum_threads
  end

  resources :markets, :path => 'marketplace' do
    resources :products, module: :markets
  end

  resources :users do
    collection do
      post :import
    end
  end

  root to: "forum_threads#index"
end
