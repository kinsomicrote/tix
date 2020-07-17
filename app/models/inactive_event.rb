class InactiveEvent < ApplicationRecord
  include RescueUniqueConstraint
  rescue_unique_constraint index: 'idx_inactive_events_on_date_and_event_id', field: 'date'
  belongs_to :event
  validates_presence_of :date
  validate :check_inactive_date

  def check_inactive_date
    errors.add(:date, "must be between start and end date of event") unless date.between?(event.start_date, event.end_date)
  end
end
