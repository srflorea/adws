class Decision < ActiveRecord::Base
	has_many :versions

	def slug
		name.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end
end
