# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create fake offers
Booking.destroy_all
Offer.destroy_all
User.destroy_all
puts "destroyed everything"

SUBJECTS = %w[
  History Math Geography English Philosophy Computer\ Science Political\ Science
  Physics Chemistry Linguistics Anthropology Sociology Biology
]

LOCATIONS = {
  "Vancouver, Canada" => ["3300 Oak St", "2725 W 42nd Ave", "1599 W 65th Ave",
                          "799 Cambie St", "6780 Butler St", "2394 Cornwall Ave"],
  "Baku, Azerbaijan",
  "Indianapolis, United States",
  "Jaipur, India",
  "Washington, D.C., United States",
  "Mexico City, Mexico",
  "Yekaterinburg, Russia",
  "Pyongyang, North Korea",
  "Chongqing, China"
}

5.times do
  user = User.create(
    name: Faker::Name.name, location: Faker::Address.city,
    email: Faker::Internet.email, password: Faker::Internet.password
  )
  rand(4).times do
    offer = Offer.new(
      topic: SUBJECTS.sample, description: Faker::Lorem.paragraph, address: Faker::Address.street_address
    )
    offer.user = user
    offer.save!
  end
end
puts "created users and offers"
