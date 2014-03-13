require 'spec_helper'

describe "decisions/edit" do
  before(:each) do
    @decision = assign(:decision, stub_model(Decision,
      :name => "MyString",
      :group_id => 1,
      :project_id => 1
    ))
  end

  it "renders the edit decision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decision_path(@decision), "post" do
      assert_select "input#decision_name[name=?]", "decision[name]"
      assert_select "input#decision_group_id[name=?]", "decision[group_id]"
      assert_select "input#decision_project_id[name=?]", "decision[project_id]"
    end
  end
end
