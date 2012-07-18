require 'spec_helper'

describe "things/show" do
  before(:each) do
    @thing = assign(:thing, stub_model(Thing,
      :short_name => "Short Name",
      :long_name => "MyText",
      :type_id => 1,
      :thing_parent_id => "Thing Parent"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Thing Parent/)
  end
end
