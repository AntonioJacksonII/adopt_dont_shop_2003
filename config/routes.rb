Rails.application.routes.draw do
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit"
  put "/shelters/:id", to: "shelters#update"
  delete "/posts/:id", to: "posts#destroy"

  get "/pets", to: "pets#index"
  get "/pets/new", to: "pets#new"
  get "/pets/:id", to: "pets#show"
  post "/pets", to: "pets#create"
  get "/pets/:id/edit", to: "pets#edit"
  put "/pets/:id", to: "pets#update"
  delete "/pets/:id", to: "pets#destroy"
end
