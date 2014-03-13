class Api::V1::DecisionsController < Api::V1::BaseController
	def index
		if params[:name].nil?
			@decisions = Decision.all
		end
	end

	def create
		decision = Decision.new(decision_params)
		if decision.save
			respond_with(decision, :location => api_v1_decision_path(decision))
		else
			respond_with(decision)
		end
	end

	def show
		@decision = Decision.find(params[:id])
	end

	private

		def decision_params
			params.require(:decision).permit(:name, :description)
		end
end