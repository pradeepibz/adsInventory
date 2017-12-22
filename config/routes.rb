Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root "home#index"
  resources :products do
    collection do
      post :import
    end
  end
  resources :billings, except: [:show]
  get '/collect-products' => "products#collect_products"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
