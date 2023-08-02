Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "clients#index"

  get "/tests" => "tests#index"
  get "/tests/:id" => "tests#show"

  get "/clients" => "clients#index"
  get "/clients/new" => "clients#new"
  get "/receive" => "clients#receive"
  get "/send" => "clients#send"
  get "/clients/:id" => "clients#show"

  post "/clients" => "clients#create"

  patch "/clients/:id" => "clients#update"
  delete "/clients/" => "clients#destroy"

  resources :clients
end
