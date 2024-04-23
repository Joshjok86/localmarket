Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'
  root to: "pages#home"
  resources :sellers do
    resources :products, except: :destroy
    resources :reviews, only: %i[show new create]
  end
  # resources :products, only: [] do
  #   resources :reviews, only: %i[show new create]
  # end
  delete '/sellers/:seller_id/products/:id', to: 'products#destroy', as: :delete_product
  delete '/sellers/:seller_id/reviews/:id', to: 'reviews#destroy', as: :delete_review
end
