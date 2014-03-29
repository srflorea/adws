class SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:create]

	def create
		user = User.where(:name => params[:signin][:name]).first

		if user && user.authenticate(params[:signin][:password])
			session[:user_id] = user.id
			render :status => 201, :json => {:response => "Signed in succesfully!"}
		else
			render :status => 500, :json => {:response => "Sorry! Try again!"}
		end
	end
end