Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sellers do
    resources :products
  end
end
