json.array!(@engagements) do |engagement|
    json.extract! engagement, :id, :title
    json.start engagement.startengagement.to_datetime
    json.end engagement.endengagement.to_datetime
    json.color engagement.artiste.color
    json.className [engagement.artiste.name.parameterize, engagement.status]
    json.url edit_engagement_url(engagement, format: :html)
end
    
    


