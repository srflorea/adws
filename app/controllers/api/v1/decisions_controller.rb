class Api::V1::DecisionsController < Api::V1::BaseController
	prepend_before_filter :signed_in_user

	def index
		@decisions = Decision.all
  		@decisions = @decisions.select { |d| d.name == params[:name] } if !params[:name].blank?
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
			params.require(:decision).permit(:name, :group_id, :project_id)
		end
end