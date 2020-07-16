class Event < ApplicationRecord
  belongs_to :user
  has_many :inactive_events
  has_many :tickets
  validates_presence_of :name, :description, :start_date, :end_date

  def end_date_after_start_date
    return unless start_date && end_date
    errors.add(:end_date, 'must be after the start date') if end_date < start_date
  end
end
