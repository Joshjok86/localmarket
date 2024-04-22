Rails.application.routes.draw do
  devise_for :users
  get '/users/:id', to: 'users#show', as: 'user'
  root to: "pages#home"
  resources :sellers do
    resources :products
  end
end
