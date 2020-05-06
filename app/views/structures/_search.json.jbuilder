 json.array!(@structures) do |structure|
  json.label           structure.title
  json.value           structure.id
  json.url structure_url(structure)
end
    
    


