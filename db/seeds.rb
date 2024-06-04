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
 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424225/Museumsinsel1_bopqcr.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424299/Museumsinsel2_rwmolt.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424341/Museumsinsel3_uirsnd.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424380/Museumsinsel4_emuoag.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424645/Oberbaumbruecke1_mxuf1b.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424655/Oberbaumbruecke2_apyoju.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424661/Oberbaumbruecke3_pahxga.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424668/Oberbaumbruecke4_r3iwah.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424532/Treptowerpark1_lcsenf.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717424538/Treptowerpark2_zfvav7.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076836/Treptowerpark3_detxbb.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076841/Treptowerpark4_trdfwn.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077367/Eastsidegallery3_pt3ynr.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077359/Eastsidegallery1_o3dca0.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077362/Eastsidegallery2_drqkic.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717077372/Eastsidegallery4_szhxfb.jpg"],

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
  { name: "Museum Island", address: "Bodestrasse 1-3, 10178 Berlin", category: culture_category, subtitle: "Museum Complex", description: "An island in the Spree river housing five world-renowned museums." },
  { name: "Oberbaum Bridge", address: "Warschauer Strasse 43, 10243 Berlin", category: hangout_category, subtitle: "Iconic Spot for Sunsets", description: "The perfect spot to talk and philosophise with your friends about anything in a very relaxed and laid-back atmosphere." },
  { name: "Treptower Park", address: "Am Treptower Park 20, 12435 Berlin", category: nature_category, subtitle: "Treptower Park is a popular public park at the Spree river.", description: "With its unique mix of river landscape, extensive meadows, tranquil areas, gardens, and places to eat and drink, Treptower Park in the district of Treptow-Köpenick is an attractive excursion destination close to the city centre. Thanks to its size, the park offers a lot of space for every form of recreation." },
  { name: "East Side Gallery", address: "Muehlenstrasse 3-100, 10243 Berlin", category: culture_category, subtitle: "Open-Air Gallery", description: "An international memorial for freedom, it consists of a series of murals painted directly on a remnant of the Berlin Wall." },
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

puts "Created #{Spot.count} location/s."




events = [
  { title: "Party at Renate", address: "Alt-Stralau 70, 10245 Berlin", date: "2024-06-08" , time: "11:00:00 pm", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717150581/dj_feewdq.jpg" },
  { title: "Vegan Sundays", address: "Kiehnwerderallee 2, 12437 Berlin", date: "2024-06-09" , time: "10:00:00 am", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717159363/vegan_l3cxgb.jpg" },
  { title: "Cabaret - The Berlin Musical", address: "Große Querallee, 10557 Berlin", date: "2024-07-13" , time: "08:00:00 pm", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717161179/Cabaret2_ajqxx1.jpg" },
  { title: "New Realities - Stories of Art, AI and Work", address: "Leipziger Straße 16, 10117 Berlin", date: "2024-06-10" , time: "10:00:00 am", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717159043/Museum_sg4p6w.jpg" },
  { title: "ILA Berlin", address: "Messe-Allee 1, 12529 Schönefeld", date: "2024-06-09" , time: "10:00:00 am", image_url: "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717161371/aviation_i4m51n.jpg" },
]

events.each do |event_data|
  new_event = Event.create!(event_data)
  new_event.photo.attach(io: URI.open(event_data[:image_url]), filename: File.basename(event_data[:image_url]))
end
puts "Events created!"


puts "Creating user/s."

users =  [ { email: "user@user.com", password: "123456", username: "user1" } ]

users.each do |user|
  User.create!(user)
end

puts "Created #{User.count} user."


experiences = [
  { user_id: User.all.sample.id, name: "Fun Day in the city", description: "A fun day in a city could start with a visit to a popular landmark or iconic attraction, setting the tone with a bit of local history and culture." },
  { user_id: User.all.sample.id, name: "Urban Adventure Day", description: "Kick off your day with a thrilling bike tour through the city, exploring hidden alleyways, scenic parks, and bustling neighborhoods" },

]
Experience.create!(experiences)
puts "Experience created! #{Experience.name}"
puts "Created #{Experience.count} experiences!"

links = [
  { spot_id: Spot.all.sample.id, experience_id: Experience.all.sample.id },
  { spot_id: Spot.all.sample.id, experience_id: Experience.all.sample.id },

]

Link.create!(links)
puts "Created #{Link.count} experiences!"
