Rails.application.routes.draw do
  # resources :donations
  # resources :beneficiaries
  # resources :charities
  # resources :donors
  # resources :admins

  #donor
get '/admin', to:"admins#index"
post '/admin/register', to: "admins#create"

post '/admin/login', to: "admins#login"

delete '/admin/logout', to: "admins#logout"
#charity
get '/charity', to:"charities#index"

post '/charity/register', to: "charities#create"
post '/charity/login', to: 'charities#login'

delete '/charity/logout', to: "charities#logout"
end
