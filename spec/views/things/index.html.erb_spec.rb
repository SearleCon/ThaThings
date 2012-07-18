require 'spec_helper'

describe "things/index" do
  before(:each) do
    assign(:things, [
      stub_model(Thing,
        :short_name => "Short Name",
        :long_name => "MyText",
        :type_id => 1,
        :thing_parent_id => "Thing Parent"
      ),
      stub_model(Thing,
        :short_name => "Short Name",
        :long_name => "MyText",
        :type_id => 1,
        :thing_parent_id => "Thing Parent"
      )
    ])
  end

  it "renders a list of things" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Thing Parent".to_s, :count => 2
  end
end
