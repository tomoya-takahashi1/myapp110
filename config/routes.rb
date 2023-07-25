Rails.application.routes.draw do
  resources :comments
  get 'posts/index'
  get 'home/top'
  root to: 'home#top'
  devise_for :users
  devise_scope :user do    #ログアウトの設定
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'guest_login', to: 'sessions#guest_login'
  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  get '/api_products_search', to: 'api_products#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
