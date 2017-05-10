Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  root to: "home#index"
  resources :events
  resources :posts
  get "/posts/:id/contact/" => "posts#contact"

  post "/posts/:id/contactname" => "posts#contactname"

end
