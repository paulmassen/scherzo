
    json.extract! structure, :id, :title, :address, :created_at, :updated_at
    json.label structure.title
    json.value structure.id
    json.url structure_url(structure, format: :json)


