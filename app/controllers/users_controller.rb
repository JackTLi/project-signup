class UsersController < ApplicationController

	def show
		if current_user.nil?
			redirect_to root_path
			flash[:alert] = "Please login first"
		else
			@user = current_user
		end
	end

end
