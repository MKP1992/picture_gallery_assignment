Rails.application.routes.draw do
  devise_for :users
  resources :categories
	resources :pictures
  root to: "pictures#index"
end