require 'spec_helper'

describe "decisions/new" do
  before(:each) do
    assign(:decision, stub_model(Decision,
      :name => "MyString",
      :group_id => 1,
      :project_id => 1
    ).as_new_record)
  end

  it "renders new decision form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", decisions_path, "post" do
      assert_select "input#decision_name[name=?]", "decision[name]"
      assert_select "input#decision_group_id[name=?]", "decision[group_id]"
      assert_select "input#decision_project_id[name=?]", "decision[project_id]"
    end
  end
end
