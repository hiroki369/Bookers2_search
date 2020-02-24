Rails.application.routes.draw do
devise_for :users
resources :books do
	resource :favorites, only: [:create, :destroy]
	resources :post_comments
end
resources :users

root to:'home#index'
get "home/about"
get "home/search"


end
