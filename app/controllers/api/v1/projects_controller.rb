class Api::V1::ProjectsController < Api::V1::ApplicationController
	prepend_before_filter :signed_in_user
end
