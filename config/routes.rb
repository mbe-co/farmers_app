Rails.application.routes.draw do
  scope "(:locale)", :locale => /pt-BR|en|fr|es/ do
    root to: 'pages#index'

    devise_for :customers
    devise_for :users

    get 'profile', to: 'customers#show'
    post 'profile', to: 'customers#create'
    get 'profile/address', to: 'address#edit'
    patch 'profile/address', to: 'address#update'

    namespace :backoffice do
      resources :categories, except: [:show]
      resources :products, except: [:show]
      resources :customers, only: [:index, :show]
      get '/home', to: 'home#index'
    end

  end
end
