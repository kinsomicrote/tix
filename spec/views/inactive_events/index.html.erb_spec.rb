require 'rails_helper'

RSpec.describe "inactive_events/index", type: :view do
  before(:each) do
    assign(:inactive_events, [
      InactiveEvent.create!(
        event: nil
      ),
      InactiveEvent.create!(
        event: nil
      )
    ])
  end

  it "renders a list of inactive_events" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
