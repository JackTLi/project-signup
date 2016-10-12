class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.from_omniauth(env["omniauth.auth"])
    session[:user] = @user
		flash[:notice] = "Hi #{@user.name}!"
    redirect_to root_path
	end

	def destroy
		session[:user] = nil
		redirect_to root_path
	end

end
