class RelationshipsController < ApplicationController
	before_action :set_user

	def create
		user = User.find(params[:follow_id])
		if current_user.follow(user)
			redirect_to users_path
		else
			redirect_to users_path
	    end
	end

	def destroy
		user = User.find(params[:follow_id])
		if current_user.unfollow(user)
			redirect_to users_path
		else
			redirect_to users_path
		end
	end



private
    def set_user
    user = User.find(params[:follow_id])
    end


end
