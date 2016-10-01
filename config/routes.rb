Rails.application.routes.draw do
  root 'welcome#home'

  resources :users, only: [:new, :create, :show, :edit]
  resources :attractions  

  get "/signin" => "sessions#new" 
  post "/signin" => "sessions#create"
  delete "/signout" => "sessions#destroy"
 post '/attractions/:id' => "attractions#ride"
end


