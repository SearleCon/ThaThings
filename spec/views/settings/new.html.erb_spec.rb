require 'spec_helper'

describe "settings/new" do
  before(:each) do
    assign(:setting, stub_model(Setting,
      :rowcountperpage => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path, :method => "post" do
      assert_select "input#setting_rowcountperpage", :name => "setting[rowcountperpage]"
      assert_select "input#setting_user_id", :name => "setting[user_id]"
    end
  end
end
