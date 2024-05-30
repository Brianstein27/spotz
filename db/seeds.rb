require "cloudinary"
require "open-uri"
require "uri"

User.destroy_all
Spot.destroy_all

# Seeding from scraped Data

# file_path = "events.csv"

# CSV.foreach(file_path, headers: :first_row) do |row|

#   Event.create!(
#     date: row["Date"],
#     time: row["Time"],
#     title: row ["Title"],
#     address: row["Address"]
#   )
# end

spot_images = [
 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717075407/Museumsinsel1_y3he0x.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717075568/Museumsinsel3_i79fwp.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717075461/Museumsinsel2_d4aqmt.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717075573/Museumsinsel4_nfvbxw.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076244/Oberbaumbruecke1_dvw65q.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076276/Oberbaumbruecke2_ngkiad.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076357/Oberbaumbruecke3_dqqtih.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076363/Oberbaumbruecke4_wgq4y3.jpg"],

 ["https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076827/Treptowerpark1_g3g1m9.jpg",
 "https://res.cloudinary.com/dn7d3hatk/image/upload/v1717076831/Treptowerpark2_oibtgx.jpg",
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

]


spots = [
  { name: "Museum Island", address: "Bodestrasse 1-3, 10178 Berlin", category: "Culture", subtitle: "Museum Complex", description: "An island in the Spree river housing five world-renowned museums." },
  { name: "Oberbaum Bridge", address: "Warschauer Strasse 43, 10243 Berlin", category: "Hangout", subtitle: "Iconic Spot for Sunsets", description: "The perfect spot to talk and philosophise with your friends about anything in a very relaxed and laid-back atmosphere." },
  { name: "Treptower Park", address: "Am Treptower Park 20, 12435 Berlin", category: "Nature", subtitle: "Treptower Park is a popular public park at the Spree river.", description: "With its unique mix of river landscape, extensive meadows, tranquil areas, gardens, and places to eat and drink, Treptower Park in the district of Treptow-Köpenick is an attractive excursion destination close to the city centre. Thanks to its size, the park offers a lot of space for every form of recreation. On sunny weekends, residents from Kreuzberg, Neukölln and Friedrichshain conquer the Volkspark." },
  { name: "East Side Gallery", address: "Muehlenstrasse 3-100, 10243 Berlin", category: "Culture", subtitle: "Open-Air Gallery", description: "An international memorial for freedom, it consists of a series of murals painted directly on a remnant of the Berlin Wall." },
  { name: "Hallmann & Klee", address: "Boehmische Strasse 13, 12055 Berlin", category: "Food'n'Drinks", subtitle: "Fine Dining", description: "You will find the restaurant on the small Boehmischer Platz, whose lively hustle and bustle makes the terrace on the sidewalk a popular spot in summer. The interior also has its charm: striking whitewashed brick walls, beautiful floorboards and modern design elements create an almost purist, charming urban ambience." },
]

spots.each_with_index do |spot, index|
  new_spot = Spot.create!(spot)
  spot_images[index].each do |image|
    new_spot.photos.attach(io: URI.open(image), filename: File.basename(image))
  end
  puts "Spot created! #{new_spot.name}"
  new_spot.save
end

puts "Created #{Spot.count} locations."

users =  [ { email: "user@user.com", password: "123456", username: "user1" } ]

users.each do |user|
  User.create!(user)
end

puts "Created #{User.count} user."
