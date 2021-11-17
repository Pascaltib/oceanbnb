require 'open-uri'
require 'nokogiri'
url = "https://www.superyachttimes.com/yachts/order:gross-tonnage:descending"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
noko_arr = html_doc.search(".yachts .yacht .visual .bg-img")


puts "Clearing database"
Booking.delete_all
User.delete_all
Yacht.delete_all
arr = ["Ibiza", "Monaco", "Gibraltar", "Malaga", "Valencia", "Barcelona","Montpellier", "Marseille", "Nice", "Genoa"]
count = 0
24.times do
  location = arr.sample
  Yacht.create!(
    {
      name: Faker::Movies::HarryPotter.character,
      description: Faker::Books::Dune.quote,
      capacity: rand(20..2000),
      location: location,
      address: location,
      image_url: noko_arr[count].attribute('style').value.match(/'(.+)'/)[1],
      price: rand(5000..1000000)
    }
  )
  count += 1
end
puts "Database recreated!"
