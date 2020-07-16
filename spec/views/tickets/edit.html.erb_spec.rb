require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      name: "MyString",
      option: 1,
      amount: 1,
      event: nil
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input[name=?]", "ticket[name]"

      assert_select "input[name=?]", "ticket[option]"

      assert_select "input[name=?]", "ticket[amount]"

      assert_select "input[name=?]", "ticket[event_id]"
    end
  end
end
