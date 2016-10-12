class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		if current_user.nil?
			redirect_to root_path
			flash[:alert] = "Please login first"
		else
			@user = current_user
		end
	end

end
