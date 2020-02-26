class SearchesController < ApplicationController

	def index
		@target = params[:target]
		if @target == "user"
		@users = User.search(params[:method],params[:search])
		else
		@books = Book.search(params[:method],params[:search])
		render 'searches/_book.html.erb'
		end
	end

end

