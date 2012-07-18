require 'spec_helper'

describe "types/show" do
  before(:each) do
    @type = assign(:type, stub_model(Type,
      :type_name => "Type Name",
      :short_label => "Short Label",
      :long_lebel => "Long Lebel"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Label/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Long Lebel/)
  end
end
