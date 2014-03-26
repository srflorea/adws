class SessionsController < ApplicationController

	def create
		user = User.where(:name => params[:signin][:name]).first

		if user && user.autheticate(params[:signin][:password])
			session[:user_id] = user.id
		end
	end
end