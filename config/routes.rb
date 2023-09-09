Rails.application.routes.draw do
  get 'dashboard/show'
  resources :comments
  root to: 'posts#home'
  get 'posts/index'
  get 'home/top'
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
  resource :dashboard, only: [:show]
  get '/dashboard/index', to: 'dashboard#index', as: 'dashboard_index'
  get 'home', to: 'posts#home', as: :home
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
