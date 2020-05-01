# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Artiste.destroy_all

Artiste.create!([{
  name: "Guillaume Bellom",
  color: Faker::Color.hex_color,

},
{
  name: "Mathilde Calderini",
  color: Faker::Color.hex_color,
},
{
  name: "Edgar Moreau",
  color: Faker::Color.hex_color,
},
{
  name: "Yan Levionnois",
  color: Faker::Color.hex_color,
},
{
  name: "Renaud Capuçon",
  color: Faker::Color.hex_color,
},
{
  name: "Nicholas Angelich",
  color: Faker::Color.hex_color,
},
{
  name: "Khatia Buniatishvili",
  color: Faker::Color.hex_color,
},
{
  name: "Martha Argerich",
  color: Faker::Color.hex_color,
},
{
  name: "Dong Hyek Lim",
  color: Faker::Color.hex_color,
},
{
  name: "David Kadouch",
  color: Faker::Color.hex_color,
}

])

p "Created #{Artiste.count} artistes"

#Engagement.destroy_all
20.times do
mynumber = Faker::Number.between(from: 1, to: 10)
begindate = Faker::Date.between(from: 5.month.ago, to: 1.year.from_now)
enddate = begindate + mynumber.days
Engagement.create!(
    title: Faker::Address.city,
    begin: begindate,
    end:  enddate,
    artiste_id: Artiste.order(Arel.sql('RANDOM()')).first.id,
    status: "confirmed" 

)
end

20.times do
mynumber = Faker::Number.between(from: 1, to: 10)
begindate = Faker::Date.between(from: 5.month.ago, to: 1.year.from_now)
enddate = begindate + mynumber.days  
Engagement.create!(
    title: Faker::Address.city,
    begin: begindate,
    end:  enddate,
    artiste_id: Artiste.order(Arel.sql('RANDOM()')).first.id,
    status: "invitation"  

)
end

20.times do
mynumber = Faker::Number.between(from: 1, to: 10)
begindate = Faker::Date.between(from: 5.month.ago, to: 1.year.from_now)
enddate = begindate + mynumber.days  
Engagement.create!(
    title: Faker::Address.city,
    begin: begindate,
    end:  enddate,
    artiste_id: Artiste.order(Arel.sql('RANDOM()')).first.id,
    status: "option"  

)
end

p "Created 60 engagements"

