class Api::V1::VersionsController < Api::V1::BaseController
	before_filter :find_decision

	def index
		@versions = @decision.versions
	end

	def create
		version = Version.new(version_params)
		if version.save
			respond_with(version, :location => api_v1_version_path(version))
		else
			respond_with(version)
		end
	end

	def show
		@version = Version.find(params[:id])
	end

	private

		def version_params
			params.require(:version).permit(:number, :state, :problem,:description, :arguments, :iteration_id, :decision_id)
		end

		def find_decision
			@decision = Decision.find(params[:decision_id])
			rescue ActiveRecord::RecordNotFound
				error = "The decision that you were looking for could not be found."
				render :json => { :error => error, :status => 404 }
		end
end