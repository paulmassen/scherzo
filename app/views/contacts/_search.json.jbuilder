 json.array!(@contacts) do |contact|
  json.label          contact.surname + " " + contact.name
  json.value           contact.id
  json.url contact_url(contact)
end
    
    


