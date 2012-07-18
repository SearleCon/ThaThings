require 'spec_helper'

describe "things/new" do
  before(:each) do
    assign(:thing, stub_model(Thing,
      :short_name => "MyString",
      :long_name => "MyText",
      :type_id => 1,
      :thing_parent_id => "MyString"
    ).as_new_record)
  end

  it "renders new thing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => things_path, :method => "post" do
      assert_select "input#thing_short_name", :name => "thing[short_name]"
      assert_select "textarea#thing_long_name", :name => "thing[long_name]"
      assert_select "input#thing_type_id", :name => "thing[type_id]"
      assert_select "input#thing_thing_parent_id", :name => "thing[thing_parent_id]"
    end
  end
end
