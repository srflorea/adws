class Decision < ActiveRecord::Base
	validates :name, presence: true
end
