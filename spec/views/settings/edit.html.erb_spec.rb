require 'spec_helper'

describe "settings/edit" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :rowcountperpage => 1,
      :user_id => 1
    ))
  end

  it "renders the edit setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path(@setting), :method => "post" do
      assert_select "input#setting_rowcountperpage", :name => "setting[rowcountperpage]"
      assert_select "input#setting_user_id", :name => "setting[user_id]"
    end
  end
end
