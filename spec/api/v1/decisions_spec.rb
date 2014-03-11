require "spec_helper"

describe "api/v1/decisions", :type => :api do 

	context "decisions viewable by this user" do
		d = Decision.new(:name => "first", :description => "without")
		d.save

		let(:url) { "/api/v1/decisions" }
		it "json" do
			get "#{url}.json"
			decisions_json = Decision.all.to_json
			last_response.body.should eql(decisions_json)
			last_response.status.should eql(200)
			decisions = JSON.parse(last_response.body)
			decisions.any? do |p|
				p["name"] == d.name
			end.should be_true
		end
	end
end