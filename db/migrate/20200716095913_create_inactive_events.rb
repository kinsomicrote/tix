class CreateInactiveEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :inactive_events do |t|
      t.date :date, null: false
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
