require 'spec_helper'

describe "types/edit" do
  before(:each) do
    @type = assign(:type, stub_model(Type,
      :type_name => "MyString",
      :short_label => "MyString",
      :long_lebel => "MyString"
    ))
  end

  it "renders the edit type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => types_path(@type), :method => "post" do
      assert_select "input#type_type_name", :name => "type[type_name]"
      assert_select "input#type_short_label", :name => "type[short_label]"
      assert_select "input#type_long_lebel", :name => "type[long_lebel]"
    end
  end
end
