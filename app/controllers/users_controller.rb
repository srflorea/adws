class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:create]

  def new
	@user = User.new
  end

  def create
	@user = User.new(user_params)

	if @user.save
		#flash[:notice] = "You have signed up successfully."
		#redirect_to projects_path
		render :status => 201, :json => {:da => "este bine", :status => 201}
	else
		render :json => {:nu => "nu este bine"}
		#render :new
	end
  end

  def show
  end

	private
		def user_params
			params.require(:user).permit(:name,
										:password,
										:password_confirmation)
		end
end
