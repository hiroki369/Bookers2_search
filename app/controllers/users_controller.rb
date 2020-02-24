class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  def show
   @user = User.find(params[:id])
   @book = Book.new
   @book_new  = Book.new

 end

 def index
  @users = User.all
  @user  = current_user
  @book  = Book.new
  @book_new  = Book.new
end


def update
  if @user.update(user_params)
   redirect_to user_path(@user.id),notice:'successfully updated'
 else
   render :edit
 end
end



def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

def correct_user
  @user = User.find(params[:id])
  redirect_to user_path(current_user) unless @user == current_user
end

def follow
  @user = User.find(params[:user_id])
  current_user.follow(@user)
  redirect_to user_path(@user)
end
#フォローする

def unfollow
  @user = User.find(params[:user_id])
  current_user.stop_following(@user)
  redirect_to user_path(@user)
end
#フォローを外す

def follow_list
  @user = User.find(params[:user_id])
end
#フォローしてる人の一覧ページ

def follower_list
  @user = User.find(params[:user_id])
end
#フォロワーの一覧ページ

end
