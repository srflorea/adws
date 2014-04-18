class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:create]

	def show
		@user = User.find(params[:id])
	end

  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params)
  		if @user.save
  	     sign_in @user
         render :json => { :message => "You have signed up succesfuly!" }
  		else
  	     render :json => { :message => "Error siging up!", :errors => @user.errors.full_messages }
  		end
  	end

  	private

  	    def user_params
  	      params.require(:user).permit(:name, :email, :password,
  	                                   :password_confirmation)
  	    end
end
