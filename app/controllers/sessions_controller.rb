class SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:create]

	def new
  	end

  	def create
  		user = User.find_by(email: params[:session][:email].downcase)
      #rescue ActiveRecord::RecordNotFound
       # error = "The decision that you were looking for could not be found."
        #render :json => { :error => error, :status => 404 }
      return render :json => { :error => "Inexistent user!" } unless user

  		if user.authenticate(params[:session][:password])
    		# Sign the user in and redirect to the user's show page.
    		sign_in user
    		render :json => {:token => cookies[:remember_token]}
  		else
    		# Create an error message and re-render the signin form.
  			render :json => {:error => "Wrong password!"}
  		end
	end

	def destroy
		sign_out
	end
end
