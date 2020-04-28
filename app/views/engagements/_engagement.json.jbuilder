  json.extract! engagement, :id, :title   
  json.start engagement.begin.to_datetime
  json.end engagement.end.to_datetime
  json.color engagement.artiste.color
  json.className engagement.artiste.name.parameterize
  json.url edit_engagement_url(engagement, format: :html) 
  
