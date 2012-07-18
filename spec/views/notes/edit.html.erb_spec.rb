require 'spec_helper'

describe "notes/edit" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :note_text => "MyText",
      :thing_id => 1
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notes_path(@note), :method => "post" do
      assert_select "textarea#note_note_text", :name => "note[note_text]"
      assert_select "input#note_thing_id", :name => "note[thing_id]"
    end
  end
end
