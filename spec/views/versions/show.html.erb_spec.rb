require 'spec_helper'

describe "versions/show" do
  before(:each) do
    @version = assign(:version, stub_model(Version,
      :number => 1,
      :state => "State",
      :problem => "Problem",
      :description => "Description",
      :arguments => "Arguments",
      :iteration_id => 2,
      :decision_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/State/)
    rendered.should match(/Problem/)
    rendered.should match(/Description/)
    rendered.should match(/Arguments/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
