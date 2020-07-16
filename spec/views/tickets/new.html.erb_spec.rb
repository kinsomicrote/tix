require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      name: "MyString",
      option: 1,
      amount: 1,
      event: nil
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[name]"

      assert_select "input[name=?]", "ticket[option]"

      assert_select "input[name=?]", "ticket[amount]"

      assert_select "input[name=?]", "ticket[event_id]"
    end
  end
end
