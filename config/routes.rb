Rails.application.routes.draw do
  # resources :donations
  # resources :beneficiaries
  # resources :charities
  # resources :donors
  # resources :admins

 resources :beneficiaries, only: [:index, :create]

get '/admin', to:"admins#index"
post '/admin/register', to: "admins#create"

post '/admin/login', to: "admins#login"

delete '/admin/logout', to: "admins#logout"

# Donor
get '/donor', to:"donors#index"
post '/donor/register', to: "donors#create"
post '/donor/login', to: 'donors#login'

delete '/donor/logout', to: "donors#logout"

# charity
get '/charity', to:"charities#index"

post '/charity/register', to: "charities#create"
post '/charity/login', to: 'charities#login'

delete '/charity/logout', to: "charities#logout"
end
