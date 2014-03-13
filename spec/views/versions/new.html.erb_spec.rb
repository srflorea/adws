require 'spec_helper'

describe "versions/new" do
  before(:each) do
    assign(:version, stub_model(Version,
      :number => 1,
      :state => "MyString",
      :problem => "MyString",
      :description => "MyString",
      :arguments => "MyString",
      :iteration_id => 1,
      :decision_id => 1
    ).as_new_record)
  end

  it "renders new version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", versions_path, "post" do
      assert_select "input#version_number[name=?]", "version[number]"
      assert_select "input#version_state[name=?]", "version[state]"
      assert_select "input#version_problem[name=?]", "version[problem]"
      assert_select "input#version_description[name=?]", "version[description]"
      assert_select "input#version_arguments[name=?]", "version[arguments]"
      assert_select "input#version_iteration_id[name=?]", "version[iteration_id]"
      assert_select "input#version_decision_id[name=?]", "version[decision_id]"
    end
  end
end
