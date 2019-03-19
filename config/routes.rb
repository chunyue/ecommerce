Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"

  namespace :admin do
    resources :products
    root "products#index"
  end
  
  resource :cart

  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
    post :add_to_cart_quantity, on: :member
    patch :sub_to_cart_quantity, on: :member
    delete :remove_item, on: :member
  end 
end
