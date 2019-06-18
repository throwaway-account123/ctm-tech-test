Rails.application.routes.draw do
  resources :merchants
  resources :transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'main#index'
end
