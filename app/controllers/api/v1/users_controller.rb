class Api::V1::UsersController < Api::V1::BaseController
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
			respond_with(@user, :location => api_v1_decision_path(@user))
		else
      error = @user.errors.full_messages
      render :status => 200, :json => {:error => error}
		end
	end

	private

	    def user_params
	      params.require(:user).permit(:name, :email, :password,
	                                   :password_confirmation)
	    end
end
