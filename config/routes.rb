Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/pets', to: 'pets#index'
end
