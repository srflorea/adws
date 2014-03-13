object @version
attributes :id, :number, :state

node(:version_url) { |version| version_path(version) }