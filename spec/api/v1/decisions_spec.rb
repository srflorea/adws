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

	context "creating a decision" do
		let(:url) { "/api/v1/decisions" }
		it "successful JSON" do
			post "#{url}.json", :decision => {
									:name => "decision2",
									:description => "desc"
									}
			decision = Decision.find_by_name!("decision2")
			route = "/api/v1/decisions/#{decision.id}"
			last_response.status.should eql(201)
			last_response.headers["Location"].should eql(route)
			last_response.body.should eql(decision.to_json)
		end

		it "unsuccessful JSON" do
			post "#{url}.json", :decision => { }
			puts last_response.status
			last_response.status.should eql(422)
			errors = {"errors" => {
						"name" => ["can't be blank"]
						}}.to_json
			last_response.body.should eql(errors)
		end
	end
end