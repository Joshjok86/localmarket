Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'
  root to: "pages#home"
  resources :sellers do
    resources :products, except: :destroy
  end
  delete '/sellers/:sellers_id/products/:id', to: 'products#destroy', as: :delete_product
end
