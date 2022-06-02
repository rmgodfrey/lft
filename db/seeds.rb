require "open-uri"
# Create fake offers

SUBJECTS = %w[
  History Math Geography English Philosophy Computer\ Science Political\ Science
  Physics Chemistry Linguistics Anthropology Sociology Biology
]

5.times do
  user = User.create(
    name: Faker::Name.name, location: Faker::Address.city,
    email: Faker::Internet.email, password: Faker::Internet.password
  )
  user.photo.attach(io: URI.open('app/assets/images/avatarexample.jpg'),
                    filename: 'avatarexample.jpg')
  rand(4).times do
    offer = Offer.new(
      topic: SUBJECTS.sample, description: Faker::Lorem.paragraph,
    )
    offer.user = user
    offer.save!
  end
end
