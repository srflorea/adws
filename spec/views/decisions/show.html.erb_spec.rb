require 'spec_helper'

describe "decisions/show" do
  before(:each) do
    @decision = assign(:decision, stub_model(Decision,
      :name => "Name",
      :group_id => 1,
      :project_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
