class Api::V1::BaseController < ActionController::Base
	before_filter :expired_session

	respond_to :json
	include SessionsHelper

	def expired_session
		if Time.now - current_user[:last_seen_at] > 600
			sign_out
			render :json => {:error => "expired session"}
		else
			current_user[:last_seen_at] = Time.now
		end
	end
end