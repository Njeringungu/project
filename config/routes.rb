Rails.application.routes.draw do
  # resources :donations
  # resources :beneficiaries
  # resources :charities
  # resources :donors
  # resources :admins
  get '/admin', to:"admins#index"
post '/admin/register', to: "admins#create"

post '/admin/login', to: "admins#login"

delete '/admin/logout', to: "admins#logout"
end
