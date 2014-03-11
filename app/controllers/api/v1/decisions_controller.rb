class Api::V1::DecisionsController < Api::V1::BaseController
	def index
		respond_with(Decision.all)
	end
end