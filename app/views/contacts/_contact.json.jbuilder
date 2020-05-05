json.extract! contact, :id, :name, :surname, :created_at, :updated_at
json.url contact_url(contact, format: :json)
