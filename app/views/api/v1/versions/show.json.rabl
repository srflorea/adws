object @version
attributes :id, :number, :state

node(:version_url) { |version| api_v1_version_url(version) }