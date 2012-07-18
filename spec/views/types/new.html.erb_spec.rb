require 'spec_helper'

describe "types/new" do
  before(:each) do
    assign(:type, stub_model(Type,
      :type_name => "MyString",
      :short_label => "MyString",
      :long_lebel => "MyString"
    ).as_new_record)
  end

  it "renders new type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => types_path, :method => "post" do
      assert_select "input#type_type_name", :name => "type[type_name]"
      assert_select "input#type_short_label", :name => "type[short_label]"
      assert_select "input#type_long_lebel", :name => "type[long_lebel]"
    end
  end
end
