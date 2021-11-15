# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing database"
Booking.delete_all
User.delete_all
Yacht.delete_all
arr = ["Ibiza", "Monaco"]
25.times do
  Yacht.create!(
    {
      name: Faker::Movies::HarryPotter.character,
      description: Faker::Books::Dune.quote,
      capacity: rand(2000),
      location: arr.sample,
      image_url: "https://source.unsplash.com/random/200x200"
    }
  )
end
puts "Database recreated!"
