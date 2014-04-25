class Decision < ActiveRecord::Base
	has_many :versions
	belongs_to :project

	def slug
		name.downcase.gsub(" ", "-")
	end

	def to_param
		"#{id}-#{slug}"
	end
end
