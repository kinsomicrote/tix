class Ticket < ApplicationRecord
  belongs_to :event
  validates_presence_of :name, :option
  enum option: { free: 1, paid: 2 }
  validates_presence_of :amount, if: :paid?
end
