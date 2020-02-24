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


put 'users/follow/:user_id' => 'users#follow'
put 'users/unfollow/:user_id' => 'users#unfollow'
#フォローとフォローを外すアクション

get 'users/follow_list/:user_id' => 'users#follow_list'
get 'users/follower_list/:user_id' => 'users#follower_list'
#フォロー・フォロワーの一覧ページ


end
