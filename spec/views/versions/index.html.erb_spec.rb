require 'spec_helper'

describe "versions/index" do
  before(:each) do
    assign(:versions, [
      stub_model(Version,
        :number => 1,
        :state => "State",
        :problem => "Problem",
        :description => "Description",
        :arguments => "Arguments",
        :iteration_id => 2,
        :decision_id => 3
      ),
      stub_model(Version,
        :number => 1,
        :state => "State",
        :problem => "Problem",
        :description => "Description",
        :arguments => "Arguments",
        :iteration_id => 2,
        :decision_id => 3
      )
    ])
  end

  it "renders a list of versions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Problem".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Arguments".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
