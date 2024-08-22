Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products
  resource :cart, only: [:show] do
    get 'finish_order', to: 'cart#finish_order', as: :finish_order
    post 'add_random', to: 'cart#add_random', as: :add_random
    post 'add/:product_id', to: 'cart#add', as: :add_to
    delete 'remove/:product_id', to: 'cart#remove', as: :remove_from
    delete 'clear', to: 'cart#clear', as: :clear
  end
  root "cart#show"
end
