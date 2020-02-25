Rails.application.routes.draw do
devise_for :users
resources :books do
	resource :favorites, only: [:create, :destroy]
	resources :post_comments
end
resources :users
get '/users/:id/follow/', to: 'users#follow', :as => :user_follow
get '/users/:id/follower/', to: 'users#follower', :as => :user_follower



root to:'home#index'
get "home/about"
get "home/search"

resources :relationships, only: [:create, :destroy]

end
