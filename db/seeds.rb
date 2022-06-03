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
  "Baku, Azerbaijan" => ["6 Vladislav Plotnikov, Bakı 1007, Azerbaijan"],
  "Indianapolis, United States" => ["828 Dorman St, Indianapolis, IN 46202, USA"],
  "Jaipur, India" => ["Chitragupt Nagar 1st, Kidwai Nagar, Tonk Phatak, Jaipur, Rajasthan 302015, India"],
  "Washington D.C., United States" => ["1199 M St NW, Washington, DC 20005, USA"],
  "Mexico City, Mexico" => ["Calle San Borja 1362-1354, Vértiz Narvarte, Benito Juárez, 03600 Ciudad de México, CDMX, Mexico"],
  "Yekaterinburg, Russia" => ["Ulitsa Shchorsa, 62А, Yekaterinburg, Sverdlovskaya oblast', Russia, 620130"],
  "Pyongyang, North Korea" => ["Kyonghung Street, Pyongyang, North Korea"],
  "Chongqing, China" => ["Guan Hong Da Dao, Jiang Bei Qu, Chong Qing Shi, China, 401147"]
}

van = "Vancouver, Canada"

LOCATIONS[van] = [
  "3300 Oak St, #{van}", "2725 W 42nd Ave, #{van}", "1599 W 65th Ave, #{van}",
  "799 Cambie St, #{van}", "6780 Butler St, #{van}", "2394 Cornwall Ave, #{van}"
]

LOCATIONS.each do |location, addresses|
  addresses.each do |address|
    user = User.create(
      name: Faker::Name.name, location: location,
      email: Faker::Internet.email, password: Faker::Internet.password
    )
    rand(3).times do
      offer = Offer.new(
        topic: SUBJECTS.sample, description: Faker::Lorem.paragraph,
        address: address
      )
      offer.user = user
      offer.save!
    end
  end
end

puts "created users and offers"
