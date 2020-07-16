require 'rails_helper'

RSpec.describe "inactive_events/new", type: :view do
  before(:each) do
    assign(:inactive_event, InactiveEvent.new(
      event: nil
    ))
  end

  it "renders new inactive_event form" do
    render

    assert_select "form[action=?][method=?]", inactive_events_path, "post" do

      assert_select "input[name=?]", "inactive_event[event_id]"
    end
  end
end
