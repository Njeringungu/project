Rails.application.routes.draw do
  resources :donations
  resources :beneficiaries
  resources :charities
  resources :donors
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
