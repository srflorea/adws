class Api::V1::BaseController < ActionController::Base
	respond_to :json

	private
		def require_signin!
			if current_user.nil?
				render :json => {:nu => 'You need to sign in before continuing!'}
			end
		end

		def current_user
			puts "---------#{session[:user_id]}---------"
			puts params
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
			if session[:user_id].nil?
				puts 'da'
			else
				puts 'nu'
			end
		end
end