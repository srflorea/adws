class Api::V1::BaseController < ActionController::Base
	respond_to :json
	include SessionsHelper
end