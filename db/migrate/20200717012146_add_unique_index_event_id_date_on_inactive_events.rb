class AddUniqueIndexEventIdDateOnInactiveEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :inactive_events, [:date, :event_id], unique: true, name: 'idx_inactive_events_on_date_and_event_id'
  end
end
