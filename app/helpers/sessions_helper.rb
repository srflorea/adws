module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		session[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.hash(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def signed_in_user
		render :json => { :error => "You need to sign in!", :token => "#{User.hash(params[:remember_token])}"} unless signed_in?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.hash(params[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		current_user.update_attribute(:remember_token,
									User.hash(User.new_remember_token))
		session.delete(:remember_token)
		self.current_user = nil
	end
end
