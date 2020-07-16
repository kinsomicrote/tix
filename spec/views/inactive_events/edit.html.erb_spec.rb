require 'rails_helper'

RSpec.describe "inactive_events/edit", type: :view do
  before(:each) do
    @inactive_event = assign(:inactive_event, InactiveEvent.create!(
      event: nil
    ))
  end

  it "renders the edit inactive_event form" do
    render

    assert_select "form[action=?][method=?]", inactive_event_path(@inactive_event), "post" do

      assert_select "input[name=?]", "inactive_event[event_id]"
    end
  end
end
