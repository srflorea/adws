object @decision
attributes :id, :name, :group_id, :project_id

node(:author) { "Razvan" }
node(:url) { |decision| decision_url(decision) }

child :versions do
	attributes :id, :number, :state
end