class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name, null: false
      t.integer :option, null: false, default: Ticket.options[:free]
      t.integer :amount
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
