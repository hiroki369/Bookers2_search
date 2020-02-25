class RelationshipsController < ApplicationController
	before_action :set_user

	def create
		user = User.find(params[:follow_id])
		if current_user.follow(user)
			redirect_to user
		else
			redirect_to user
	    end
	end

	def destroy
		user = User.find(params[:follow_id])
		if current_user.unfollow(user)
			redirect_to user
		else
			redirect_to user
		end
	end



private
    def set_user
    user = User.find(params[:follow_id])
    end


end
