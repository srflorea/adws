object @decision
attributes :id, :name, :group_id, :project_id

node(:decision_url) { |decision| api_v1_decision_url(decision) }

child :versions do
	attributes :id, :number, :state
end