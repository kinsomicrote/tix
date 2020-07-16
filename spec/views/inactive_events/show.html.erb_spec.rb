require 'rails_helper'

RSpec.describe "inactive_events/show", type: :view do
  before(:each) do
    @inactive_event = assign(:inactive_event, InactiveEvent.create!(
      event: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
