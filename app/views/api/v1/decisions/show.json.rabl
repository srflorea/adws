object @decision
attributes :id, :name, :description

node(:author) { "Razvan" }
node(:url) { |decision| decision_url(decision) }