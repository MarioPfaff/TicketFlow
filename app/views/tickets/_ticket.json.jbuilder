json.extract! ticket, :id, :title, :content, :label, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
