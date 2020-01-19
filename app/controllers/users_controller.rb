class UsersController < ApplicationController

before_action :authenticate_user!


def correct_user
  @user = current_user
    unless @user
      redirect_to root_path
    end
end


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

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if
	 @user.update(user_params)
	 redirect_to user_path(@user.id),notice:'successfully updated'
    else
     render :edit
    end
end

def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)
end





end
