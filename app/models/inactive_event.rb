class InactiveEvent < ApplicationRecord
  belongs_to :event
  validates_presence_of :date
  validate :check_inactive_date, :check_existing_date

  def check_inactive_date
    puts "EEE #{event}"
    errors.add(:date, "Inactive date must be between start and end date of event") unless date.between?(event.start_date, event.end_date)
  end

  def check_existing_date
    rec = InactiveEvent.where(date: date, event_id: event.id)
    puts "zzzz #{rec}"
    errors.add(:date, "Date already exists") unless InactiveEvent.find_by(date: date, event_id: event.id).nil?
  end
end
