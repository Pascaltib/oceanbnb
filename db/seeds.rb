require 'open-uri'
require 'nokogiri'
url = "https://www.superyachttimes.com/yachts/order:gross-tonnage:descending"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
noko_arr = html_doc.search(".yachts .yacht .visual .bg-img")

puts "Clearing database"
Booking.delete_all
User.delete_all
Ammenity.delete_all
Yacht.delete_all
name_arr = ["Seaduction", "For Reels", "Yachts All Folks", "Bacon in the Sun", "Best Sailection", "Legacy", "Miss Conduct", "Alotta Ocean", "Vamoose", "Row V. Wave", "Dreadnought", "Best of Boat Worlds", "Dirty Oar", "Ships n' Giggles", "The Court Ship", "Tumeric", "Moor Often Than Knot", "Sea Senora", "Life is Good", "Grace to Glory", "Big Nauti", "B-Yacht'ch", "Inversion of the Curve", "Seas the Day", "Fandango"]
desc_arr = ["2017 Grady-White Adventure 208 Grady-Whites heritage and expertise in the design of 20-foot walkaround cabin boats began over 40 years ago with the companys pioneering Overnighter. The Adventure 208 brings the full measure of walkaround style to todays boat market.","1998 Trojan 35 express  37 OAL.  Great condition for its age. Twin 454 motors with direct drive. Props are recessed into the hull. Gets up on plain quickly. Lots of power with this one.","Currently Familties Ties IV in the newest and latest Late Model 2020 Back Cove - 41 to arrive on the market. She is complete in every way with Ultra-low hours at 175, she runs with the Upscale Volvo D11 725 HP engine (fully warrantied out till July of 2024).", "”2007 Regal Commodore 4460. Over $50,000.00 in updates and maintenance just completed. This boat shows great. Freshwater for the last three years and well taken care of. Come see her today!","Pursuit 2006 3070 Offshore re-powered in 2016 with twin Yamaha 250s (MODEL F250XCA). Awesome boat for both family and offshore fishing.","The Linda 28 is a fast and nimble pocket cruiser built on a custom basis for customers with an outstanding fit and finish, the kind youd expect from Morris Yachts.","This 43 trawler has the strength, charm and craftsmanship of the Taiwanese boat builders are famous for.","Huge queen-sized aft berth and cabin, twin electric heads, full galley with microwave, new fridge, stove and double SS sink. The salon is warm and well-lit. With TV, stereo and speakers for both inside and outside listening.", "Twin helm stations with reasonably up-to-date electronics including Simrad autopilot,  newer Raymarine A65 GPS/radar.  Powered by twin Caterpillar 3208 diesels famous for reliability. Westerbeke 7KW generator runs great.","The aft sundeck is enormous and enclosed but clean and clear Eisenglass with roll up shades for ventilation. The Xantex inverter allows for AC/heat and battery charging.","This 43 trawler has the strength, charm and craftsmanship of the Taiwanese boat builders are famous for. LE CHALET would make a great liveaboard or ICW loop-er.","Huge queen-sized aft berth and cabin, twin electric heads, full galley with microwave, new fridge, stove and double SS sink. The salon is warm and well-lit. With TV, stereo and speakers for both inside and outside listening.","2017 Grady-White Adventure 208
Grady-Whites heritage and expertise in the design of 20-foot walkaround cabin boats began over 40 years ago with the companys pioneering 204C Overnighter. The Adventure 208 brings the full measure of walkaround style and a SeaV2 ride to todays boat market.", "1998 Trojan 35 express  37 OAL.  Great condition for its age. Twin 454 motors with direct drive. Props are recessed into the hull. Gets up on plain quickly. Lots of power with this one.","Currently Familties Ties IV in the newest and latest Late Model 2020 Back Cove - 41 to arrive on the market. She is complete in every way with Ultra-low hours at 175, she runs with the Upscale Volvo D11 725 HP engine (fully warrantied out till July of 2024).","2007 Regal Commodore 4460. Over $50,000.00 in updates and maintenance just completed. This boat shows great. Freshwater for the last three years and well taken care of. Come see her today!","Pursuit 2006 3070 Offshore re-powered in 2016 with twin Yamaha 250s (MODEL F250XCA). Awesome boat for both family and offshore fishing.","The Linda 28 is a fast and nimble pocket cruiser built on a custom basis for customers with an outstanding fit and finish, the kind youd expect from Morris Yachts.", "This 43 trawler has the strength, charm and craftsmanship of the Taiwanese boat builders are famous for.","Huge queen-sized aft berth and cabin, twin electric heads, full galley with microwave, new fridge, stove and double SS sink. The salon is warm and well-lit. With TV, stereo and speakers for both inside and outside listening.","Twin helm stations with reasonably up-to-date electronics including Simrad autopilot,  newer Raymarine A65 GPS/radar.  Powered by twin Caterpillar 3208 diesels famous for reliability. Westerbeke 7KW generator runs great.","The aft sundeck is enormous and enclosed but clean and clear Eisenglass with roll up shades for ventilation. The Xantex inverter allows for AC/heat and battery charging.","This 43 trawler has the strength, charm and craftsmanship of the Taiwanese boat builders are famous for. LE CHALET would make a great liveaboard or ICW loop-er.","Huge queen-sized aft berth and cabin, twin electric heads, full galley with microwave, new fridge, stove and double SS sink. The salon is warm and well-lit. With TV, stereo and speakers for both inside and outside listening.","The aft sundeck is enormous and enclosed but clean and clear Eisenglass with roll up shades for ventilation. The Xantex inverter allows for AC/heat and battery charging."]

arr = ["Ibiza", "Monaco", "Gibraltar", "Malaga", "Torrevieja", "Alicante", "Villajoyosa", "Valencia", "Cambrils", "Tarragona", "Barcelona", "Montpellier", "Marseille", "Toulon", "Cannes", "Nice", "Menton", "Sanremo", "Albenga", "Genoa", "Tarifa", "Algeciras", "Marbella", "Almeria", "Benidorm"]
bool_arr = [true, false, true]
count = 0
24.times do
  temp = Yacht.create!(
    {
      name: name_arr[count],
      description: desc_arr[count],
      capacity: rand(20..2000),
      location: arr[count],
      address: arr[count],
      image_url: noko_arr[count].attribute('style').value.match(/'(.+)'/)[1],
      price: rand(5000..1000000)
    }
  )
  Ammenity.create!(
    {
      wifi: bool_arr.sample,
      restaurant: bool_arr.sample,
      pool: bool_arr.sample,
      jacuzzi: bool_arr.sample,
      yacht: temp
    }
  )
  count += 1
end
User.create!(
  {
    email: "admin@gmail.com",
    password: "password",
    first_name: "Sally",
    last_name: "Secret",
    location: "Madrid"
  }
)
puts "Database recreated!"
