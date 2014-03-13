require 'spec_helper'

describe "decisions/index" do
  before(:each) do
    assign(:decisions, [
      stub_model(Decision,
        :name => "Name",
        :group_id => 1,
        :project_id => 2
      ),
      stub_model(Decision,
        :name => "Name",
        :group_id => 1,
        :project_id => 2
      )
    ])
  end

  it "renders a list of decisions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
