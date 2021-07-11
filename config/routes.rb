Rails.application.routes.draw do
  scope "(:locale)", :locale => /pt-BR|en|fr|es/ do
    root to: 'pages#index'
    devise_for :customers
    devise_for :users
    namespace :backoffice do
      resources :categories, except: [:show]
      resources :products, only: [:index, :new]
      get '/home', to: 'home#index'
    end
  end
end
