json.extract! ticket, :id, :name, :option, :amount, :event_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
