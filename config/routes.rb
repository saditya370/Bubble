Rails.application.routes.draw do

  Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "inventory_products", to: "inventory#index"
  get "all_products", to: "product#index"
  post "create_products",to: "product#create"
  delete "delete_product", to: "product#destroy"
end
