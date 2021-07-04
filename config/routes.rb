Rails.application.routes.draw do
  scope "(:locale)", :locale => /pt-BR|en|fr|es/ do
    root to: 'pages#index'
    devise_for :customers
  end
end
