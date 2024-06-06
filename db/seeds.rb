require "cloudinary"
require "open-uri"
require "uri"

Review.destroy_all
puts "Deleted reviews!"

Link.destroy_all
puts "Deleted links!"

Experience.destroy_all
puts "Deleted experiences!"

User.destroy_all
puts "Deleted users!"

Spot.destroy_all
puts "Deleted spots!"

Category.destroy_all
puts "Deleted categories!"

Event.destroy_all
puts "Deleted events!"


# ["Food'n'Drinks", "Culture", "Nightlife", "Nature", "Activity", "Hangout", "Playground"]

foodanddrinks_category = Category.create!(name: "Food'n'Drinks")
culture_category = Category.create!(name: "Culture")
nightlife_category = Category.create!(name: "Nightlife")
nature_category = Category.create!(name: "Nature")
activity_category = Category.create!(name: "Activity")
hangout_category = Category.create!(name: "Hangout")
playground_category = Category.create!(name: "Playground")



spot_images = [
  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717656941/le_wagon6_rz5cv7.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717503047/LeWagon2_z2v2nz.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717656935/le_wagon5_p1dce0.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717503052/LeWagon3_mtwm2t.png"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717503652/Kamps1_nl1llh.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717503659/Kamps2_vqhtms.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717503664/Kamps3_ytghh2.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717504036/Besselpark1_wbroku.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717504042/Besselpark2_gdtaq2.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717504047/Besselpark3_c5iaws.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717504300/Lidl1_dlx2rr.webp",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717504305/Lidl2_ncfils.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717504312/Lidl3_dmo3qs.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424645/Oberbaumbruecke1_mxuf1b.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424655/Oberbaumbruecke2_apyoju.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424661/Oberbaumbruecke3_pahxga.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424668/Oberbaumbruecke4_r3iwah.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077367/Eastsidegallery3_pt3ynr.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077359/Eastsidegallery1_o3dca0.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077362/Eastsidegallery2_drqkic.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077372/Eastsidegallery4_szhxfb.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717656583/hinterhof_1_mnxsxf.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717656591/hinterhof_2_p66evz.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717656599/hinterhof_4_pwguzs.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717656861/hinterhof_3_one60t.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717657512/Sp%C3%A4ti1_krkgku.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717657520/sp%C3%A4ti2_hfb0df.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717657525/Sp%C3%A4ti3_qv8zya.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717657534/Sp%C3%A4ti4_gou0uw.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717658836/See2_lwgovt.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717658826/See1_phqabi.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717658841/See4_huc30b.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717658910/See5_r3vlvz.jpg"],

  ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424532/Treptowerpark1_lcsenf.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424538/Treptowerpark2_zfvav7.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076836/Treptowerpark3_detxbb.jpg",
  "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076841/Treptowerpark4_trdfwn.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077927/hallmann--klee2_xdavsn.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077919/hallmann--klee_bn6wuw.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717078034/hallmann--klee3_zf20z0.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717078082/hallmann--klee4_zkmxuu.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717149606/KINK2_bbbksc.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717149612/KINK3_cmrhej.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717149618/KINK4_ac5pv2.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717149624/KINK5_wufori.jpg"],


]

spots = [
  { name: "LeWagon Mastercoding", address: "Rudi-Dutschke-Straße 26, 10969 Berlin", category: activity_category, subtitle: "Best Coding Bootcamp ever", description: "Legends are trained here. An international school that teaches you to become one of the best coders in the world in just a few weeks." },
  { name: "Kamps Bakery", address: "Friedrichstraße 186, 10117 Berlin", category: foodanddrinks_category, subtitle: "The finest bakery", description: "This bakery brings together everything you need for a quick energy boost between debugging and coding." },
  { name: "Besselpark", address: "Enckestraße 1, 10969 Berlin", category: nature_category, subtitle: "The Heartbeat of Urban Serenity", description: "Besselpark is Berlin's urban oasis where culture and tranquility coexist. With lush green lawns, modern art installations, and serene water features, it's the perfect spot to unwind, meet friends, or find inspiration." },
  { name: "Lidl Byte", address: "Charlottenstraße 2, 10969 Berlin", category: foodanddrinks_category, subtitle: "For Smart Shoppers", description: "The ultimate destination for tech-savvy shoppers. Here, you'll find all your everyday essentials alongside the latest salads, chocolate, and smart home devices. Whether you're stocking up on groceries or picking up a new keyboard, Lidl has everything you need to fuel both your body and your projects, all at unbeatable prices." },
  { name: "Oberbaum Bridge", address: "Warschauer Strasse 43, 10243 Berlin", category: hangout_category, subtitle: "Iconic Spot for Sunsets", description: "The perfect spot to talk and philosophise with your friends about anything in a very relaxed and laid-back atmosphere." },
  { name: "East Side Gallery", address: "Muehlenstrasse 3-100, 10243 Berlin", category: culture_category, subtitle: "Open-Air Gallery", description: "An international memorial for freedom, it consists of a series of murals painted directly on a remnant of the Berlin Wall." },
  { name: "Courtyard Hangout", address: "Rudi-Dutschke-Straße 26, 10969 Berlin", category: hangout_category, subtitle: "Where the cool kids hang out", description: "A courtyard hangout where coders can unwind on a pretty bench, enjoy fast WiFi, and relax among lush greenery. It's the perfect spot to clear your mind and refactor your thoughts.." },
  { name: "Drinkpoint", address: "Friedrichstraße 41, 10969 Berlin", category: nightlife_category, subtitle: "Beers and more", description: "Tucked away on the corner, this Späti is your one-stop shop for all your late-night cravings and spontaneous adventures." },
  { name: "Café am Neuen See", address: "Lichtensteinallee 2, 10787 Berlin", category: foodanddrinks_category,  subtitle: "A lovely beer garden and café", description: "Café am Neuen See, nestled in Berlin's Tiergarten, offers a serene retreat with picturesque lakeside views. This charming café and beer garden features a relaxed atmosphere, perfect for unwinding amidst lush greenery. Guests can enjoy a variety of hearty German dishes and refreshing beverages, making it an ideal spot for both casual dining and leisurely drinks. Boat rentals on the adjacent lake add a touch of adventure, enhancing the overall experience." },
  { name: "Treptower Park", address: "Am Treptower Park 20, 12435 Berlin", category: nature_category, subtitle: "Treptower Park is a popular public park at the Spree river.", description: "With its unique mix of river landscape, extensive meadows, tranquil areas, gardens, and places to eat and drink, Treptower Park in the district of Treptow-Köpenick is an attractive excursion destination close to the city centre. Thanks to its size, the park offers a lot of space for every form of recreation." },
  { name: "Hallmann & Klee", address: "Boehmische Strasse 13, 12055 Berlin", category: foodanddrinks_category, subtitle: "Fine Dining", description: "You will find the restaurant on the small Boehmischer Platz, whose lively hustle and bustle makes the terrace on the sidewalk a popular spot in summer." },
  { name: "KINK", address: "Schoenhauser Allee 176, 10119 Berlin", category: foodanddrinks_category, subtitle: "Fine Dining", description: "The Kink Bar brings together what belongs together: kitchen and bar. In the middle of Berlin, high-end and laid back." },
]


spots.each_with_index do |spot, index|
  new_spot = Spot.create!(spot)
  spot_images[index].each do |image|
    new_spot.photos.attach(io: URI.open(image), filename: File.basename(image))
  end
  puts "Spot created! #{new_spot.name}"
  new_spot.save
end

puts "Created #{Spot.count} spotz!"




events = [
  { title: "Drum Lessons", address: "Rudi-Dutschke-Str. 26, 10969 Berlin", date: "2024-06-07" , time: "09:00:00 pm", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717502867/DR_mszwgj.png" },
  { title: "Rails: From Confused to Confused", address: "Rudi-Dutschke-Str. 26, 10969 Berlin", date: "2024-08-08" , time: "01:00:00 pm", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717497391/Luise_ckypml.png" },
  { title: "Nigerian Prince Tutorials", address: "Platz d. Republik 1, 10557 Berlin", date: "2024-06-09" , time: "11:00:00 am", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717596446/nigerian_prince_rcvrmk.jpg" },
  { title: "Camel & Code", address: "Prinzenstraße 113-119, 10969 Berlin", date: "2024-06-10" , time: "10:00:00 am", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717498581/CC_f0pfho.png" },
  { title: "Beers & Axes", address: "Karl-Liebknecht-Str. 9, 10178 Berlin", date: "2024-06-08" , time: "07:00:00 pm", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717497234/Beer_wzqken.png" },
]

events.each do |event_data|
  new_event = Event.create!(event_data)
  new_event.photo.attach(io: URI.open(event_data[:image_url]), filename: File.basename(event_data[:image_url]))
end
puts "Events created!"


puts "Creating user/s."

user_avatars = [
"https://res.cloudinary.com/dn7d3hatk/image/upload/v1717512557/Emma_ehgg1t.jpg",
"https://res.cloudinary.com/dn7d3hatk/image/upload/v1717512647/Precious_njbmyw.jpg",
"https://res.cloudinary.com/dn7d3hatk/image/upload/v1717659181/Brian1_dd3vzp.jpg",
"https://res.cloudinary.com/dn7d3hatk/image/upload/v1717659372/Profilbild2_snr87q.png",
"https://res.cloudinary.com/dn7d3hatk/image/upload/v1717659940/alberto_e3p918.png",
"https://res.cloudinary.com/dn7d3hatk/image/upload/v1717660233/Angela_fcmj9l.png",
]

users =  [
  { email: "emma@lewagon.com", password: "123456", username: "emmvs" },
  { email: "precious@precious.com", password: "123456", username: "precious" },
  { email: "brian@brian.de", password: "brianbrian", username: "brianstein27" },
  { email: "franzi@franzi.com", password: "123456", username: "franzi" },
  { email: "alberto@spotzmaster.com", password: "123456", username: "alberto" },
  { email: "angie@angie.com", password: "123456", username: "angie108" },
]

users.each_with_index do |user, index|
  new_user = User.create!(user)
  new_user.photo.attach(io: URI.open(user_avatars[index]), filename: File.basename(user_avatars[index]))
  puts "User created! #{new_user.username}"
  new_user.save
end

puts "Created #{User.count} user."

experiences = [
  { user_id: User.all.first.id, name: "Rake it till you make it at le Wagon!", description: "Start you daily grind with breakfast at Kamps. After a well deserved nap during your coding lecture at le Wagon get lunch at Lidl and spend the rest of the day enjoying the sun at the Besselpark." },
  { user_id: User.all.last.id, name: "Urban Adventure Day", description: "Kick off your day with a thrilling bike tour through the city, exploring hidden alleyways, scenic parks, and bustling neighborhoods" },
]

  Experience.create!(experiences)
  puts "Experience created! #{Experience.name}"
  puts "Created #{Experience.count} experiences!"

links = [
  { spot_id: Spot.all.first.id, experience_id: Experience.all.first.id },
  { spot_id: Spot.all.second.id, experience_id: Experience.all.first.id },
  { spot_id: Spot.all.third.id, experience_id: Experience.all.first.id },
  { spot_id: Spot.all.fourth.id, experience_id: Experience.all.first.id },
  { spot_id: Spot.all.fifth.id, experience_id: Experience.all.second.id },
  { spot_id: Spot.all.last.id, experience_id: Experience.all.second.id },
]

Link.create!(links)
puts "Created #{Link.count} links!"
