require 'spec_helper'

describe "types/index" do
  before(:each) do
    assign(:types, [
      stub_model(Type,
        :type_name => "Type Name",
        :short_label => "Short Label",
        :long_lebel => "Long Lebel"
      ),
      stub_model(Type,
        :type_name => "Type Name",
        :short_label => "Short Label",
        :long_lebel => "Long Lebel"
      )
    ])
  end

  it "renders a list of types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Label".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Long Lebel".to_s, :count => 2
  end
end
