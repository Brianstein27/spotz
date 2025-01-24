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

foodanddrinks_category = Category.create!(name: "Food'n'Drinks")
culture_category = Category.create!(name: "Culture")
nightlife_category = Category.create!(name: "Nightlife")
nature_category = Category.create!(name: "Nature")
activity_category = Category.create!(name: "Activity")
hangout_category = Category.create!(name: "Hangout")
playground_category = Category.create!(name: "Playground")

spots = [
  {
    details: {  name: "Oberbaum Bridge", address: "Warschauer Strasse 43, 10243 Berlin", category: hangout_category,
                subtitle: "Iconic Spot for Sunsets", description: "The perfect spot to talk and philosophise with your friends about anything in a very relaxed and laid-back atmosphere." },
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736852817/spotz/oberbaumbruecke-u-bahn_r6icuy.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668421/spotz/maxresdefault_vwqc6u.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668421/spotz/oberbaumbruecke-berlin-cbaa3e6f-bc96-4271-a4c3-b8aed25f3170_kbfgg4.jpg"]
  },
  {
    details: {  name: "East Side Gallery", address: "Muehlenstrasse 3-100, 10243 Berlin", category: culture_category,
                subtitle: "Open-Air Gallery", description: "A vibrant open-air gallery along a preserved section of the Berlin Wall, the East Side Gallery features over 100 murals by artists from around the world, symbolizing freedom and unity. It’s a must-visit destination for history and art lovers alike, offering a unique blend of culture and powerful political messages. Located along the Spree River, it also provides stunning views of Berlin’s urban landscape." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736852956/spotz/caption_drs7x3.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668562/spotz/east-side-gallery_asaggo.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668561/spotz/EastSideGallery-Berlin_201505DSC_0489_qdmyu1.jpg"]
  },
  {
    details: {  name: "Café am Neuen See", address: "Lichtensteinallee 2, 10787 Berlin", category: foodanddrinks_category,
                subtitle: "A lovely beer garden and café", description: "Café am Neuen See, nestled in Berlin's Tiergarten, offers a serene retreat with picturesque lakeside views. This charming café and beer garden features a relaxed atmosphere, perfect for unwinding amidst lush greenery. Guests can enjoy a variety of hearty German dishes and refreshing beverages, making it an ideal spot for both casual dining and leisurely drinks. Boat rentals on the adjacent lake add a touch of adventure, enhancing the overall experience." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736853044/spotz/cafe-am-neuen-see_f2ei1y.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668762/spotz/066e307e-3deb-4fe0-b88d-c10d783d9824_iasyab.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668761/spotz/20200725_1232026757749722307559891-2048x1152_k9kmwp.jpg"]
  },
  {
    details: {  name: "Körnerpark", address: "Schierker Str., 12051 Berlin", category: hangout_category,
                subtitle: "A Serene Hidden Gem in the Heart of Neukölln", description: "Hidden in the lively district of Neukölln, Körnerpark is a peaceful oasis designed in the style of a French palace garden. With its cascading fountains, lush greenery, and charming café, it offers a perfect escape from the city's hustle and bustle. The park also hosts art exhibitions and concerts, making it a vibrant community hub." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737711203/spotz/imago0084803176h-scaled_vzvqat.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737711203/spotz/fullsizeoutput_730-2048x1365_gwwjse.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737711202/spotz/0_r3nsjc.webp"]
  },
  {
    details: {  name: "Museumsinsel", address: "Unter den Linden 1, 10178 Berlin", category: culture_category,
                subtitle: "Berlin’s Cultural and Historical Treasure", description: "This UNESCO World Heritage Site is a treasure trove of art and history, housing five world-renowned museums on a picturesque island in the Spree River. From ancient Egyptian artifacts to 19th-century paintings, visitors can explore millennia of human creativity and achievement. Its architectural grandeur and central location make it a cultural heart of Berlin." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737710961/spotz/50222752-lm-1048-166acb7becf_bm8z5o.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737710862/spotz/museumsinsel-and-dom_r5ad04.webp", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737710962/spotz/csm_Museumsinsel-Berlin-Panorama_ae81dbba5b_pyizgq.jpg"]
  },
  {
    details: {  name: "Grunewald", address: "Alte Spandauer Poststraße, 14193 Berlin", category: nature_category,
                subtitle: "Berlin's Lush Forest Retreat", description: "Grunewald is a sprawling forest on the outskirts of Berlin, offering a tranquil escape into nature with its dense woodlands, serene lakes, and scenic trails. Perfect for hiking, cycling, or simply unwinding, this natural haven also features landmarks like the Teufelsberg and Grunewaldsee. It’s an ideal destination for outdoor enthusiasts and those seeking a peaceful retreat from the city." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737712141/spotz/elb_0008ead6_leohs6.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712142/spotz/3059538300_a09fe0fa8b_b_ad9he8.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712144/spotz/DSC3038_sxjhld.jpg"]
  },
  {
    details: {  name: "Treptower Park", address: "Puschkinallee 15B, 12435 Berlin", category: nature_category,
                subtitle: "A Riverside Haven with History and Charm", description: "Treptower Park is a picturesque green space along the Spree River, known for its sprawling meadows, serene pathways, and the iconic Soviet War Memorial. Visitors can enjoy boat rides, picnics, or a stroll through the charming Insel der Jugend (Island of Youth). It’s a perfect spot to relax, connect with history, or explore Berlin’s natural beauty." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737712434/spotz/07-treptower-park-berlin-m-07665712-jpg--82332-_mvktzj.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712433/spotz/treptower-park_0_n0wyjc.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712434/spotz/sowjetisches-ehrenmal-treptower-park-an-61172_wgwyvh.jpg"]
  },
  {
    details: {  name: "Insel der Jugend", address: "Alt Treptow 6, 12435 Berlin", category: hangout_category,
                subtitle: "A Cozy Island Retreat in Berlin", description: "Insel der Jugend, or Island of Youth, is a charming little island connected to Treptower Park by a historic bridge. It’s a peaceful spot to enjoy the outdoors, featuring a cozy café, event spaces, and opportunities for kayaking or paddle boating on the Spree River. With its relaxed atmosphere, it’s a favorite destination for locals and visitors alike." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737712635/spotz/imago0259029045s_dgtspn.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712635/spotz/MIN_132_Insel_der_Jugend_s_gyiscy.png", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712635/spotz/die-abteibruecke-verbindet-seit-1916-47874_rffl8v.jpg"]
  },
  {
    details: {  name: "Ritterburspielplatz", address: "Elfriede-Kuhr-Straße 7, 12355 Berlin", category: playground_category,
                subtitle: "A Medieval Adventure for Kids", description: "The Abenteuerspielplatz Ritterburg in Rudow is a unique playground designed like a medieval castle, sparking imagination and creativity in children. Complete with wooden towers, bridges, and climbing structures, it offers endless opportunities for exploration and fun. This community-run space also hosts workshops and activities, making it a vibrant hub for young adventurers." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737712916/spotz/4859-15237073_yqysf6.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712916/spotz/spielplatz-1-680x383_py6rrv.png", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737712886/spotz/4859-image2008_tl47xr.jpg"]
  },
  {
    details: {  name: "Pura Vida Sailing", address: "Elfriede-Kuhr-Straße 7, 12355 Berlin", category: activity_category,
                subtitle: "Sailing Adventures on Berlin’s Waters", description: "Segelschule Pura Vida Berlin offers a perfect way to explore Berlin's lakes and rivers while learning the art of sailing. Whether you’re a beginner or an experienced sailor, the school provides personalized lessons and boat rentals for all skill levels. Located in a picturesque setting, it’s an ideal spot to embrace the serenity of sailing and connect with nature.
" }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737713143/spotz/optimisten-04_ev7bmp.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737713142/spotz/images_Bild-Pura-Vida-Segelschule-Berlin_elzwlk.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737713142/spotz/optimisten-01_l47pwv.jpg"]
  },
  {
    details: {  name: "Monarch Bar", address: "Skalitzer Str. 134, 10999 Berlin", category: nightlife_category,
                subtitle: "Eclectic Vibes with a View in Kreuzberg", description: "Monarch Bar, perched above Kottbusser Tor, offers a cozy yet edgy ambiance with stunning views of Berlin’s bustling streets below. Known for its eclectic music, ranging from live performances to curated DJ sets, it’s a hotspot for creatives and night owls. Grab a drink, soak in the atmosphere, and enjoy one of Berlin’s quintessential nightlife experiences." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1737713498/spotz/img-20180104-210234-largejpg_evk4g6.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737713496/spotz/l_wia781.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737713497/spotz/monarch-scaled_wwfabq.webp"]
  },
]

spots.each do |spot|
  new_spot = Spot.create!(spot[:details])
  spot[:images].each do |image|
    new_spot.photos.attach(io: URI.open(image), filename: File.basename(image))
  end
  puts "Spot created! #{new_spot.name}"
  new_spot.save
end

puts "Created #{Spot.count} spotz!"

events = [
  { title: "Drum Lessons", address: "Rudi-Dutschke-Str. 26, 10969 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667248/spotz/istockphoto-982769906-1024x1024_tpt0fv.jpg" },
  { title: "Show", address: "Gutschmidtstr. 11, 12351 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667286/spotz/istockphoto-2008322783-1024x1024_dn7r11.jpg" },
  { title: "Pottery class", address: "Littenstraße 106, 10179 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667448/spotz/istockphoto-2156595393-1024x1024_qzgmmd.jpg" },
  { title: "Ausstellung", address: "Potsdamer Str. 50, 10785 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667447/spotz/istockphoto-1687880344-1024x1024_teicgj.jpg" },
  { title: "Konzert", address: "Columbiadamm 13-21, 10965 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667446/spotz/istockphoto-492738668-1024x1024_htbwnf.jpg" },
  { title: "Kochkurs", address: "Columbiadamm 59, 10965 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667434/spotz/istockphoto-1371291010-1024x1024_em1uzt.jpg" },
  { title: "Running Group", address: "Pücklerstraße 34, 10997 Berlin", date: "2024-06-07", time: "09:00:00 pm",
    image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1737667491/spotz/istockphoto-1932548734-1024x1024_d67tuu.jpg" }
]

events.each do |event_data|
  new_event = Event.create!(event_data)
  new_event.photo.attach(io: URI.open(event_data[:image_url]), filename: File.basename(event_data[:image_url]))
end
puts "Events created!"

puts "Creating user/s."

user_avatars = [
  "https://res.cloudinary.com/djyxemrhk/image/upload/v1716475887/development/m0tcsipgpb5rpydi8umo7zwnq8iw.jpg",
  "https://res.cloudinary.com/djyxemrhk/image/upload/v1715851731/cld-sample.jpg"
]

users = [
  { email: "brian@brian.de", password: "brianbrian", username: "brianstein27" },
  { email: "emma@emma.com", password: "emmaemma", username: "emma_uloma" }
]

users.each_with_index do |user, index|
  new_user = User.create!(user)
  new_user.photo.attach(io: URI.open(user_avatars[index]), filename: File.basename(user_avatars[index]))
  puts "User created! #{new_user.username}"
  new_user.save
end

20.times do
  user = {
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Internet.user_name, 
  }
  new_user = User.create!(user)
  new_user.photo.attach(io: URI.open("https://res.cloudinary.com/djyxemrhk/image/upload/v1737637673/spotz/Blank-profile-image_jkqrga.jpg"), filename: File.basename("avatar"))
  puts "User created! #{new_user.username}"
  new_user.save
end

puts "Created #{User.count} user."

User.all.each do |user|
  experience = Experience.create!({user_id: user.id, name: Faker::Game.title, description: Faker::Games::WorldOfWarcraft.quote})
  puts "Experience created! #{experience.name}"

  Spot.all.each do |spot|
    Link.create!({spot_id: spot.id, experience_id: experience.id})
  end
end

puts "Created #{Experience.count} experiences!"
puts "Created #{Link.count} links!"

Spot.all.each do |spot|
  User.all.each do |user|
    review = Review.create!({ user_id: user.id, reviewable_type: "Spot", reviewable_id: spot.id, rating: rand(1..5), content: Faker::Quote.famous_last_words })
  end
end

Experience.all.each do |experience|
  User.all.each do |user|
    Review.create!({ user_id: user.id, reviewable_id: experience.id, reviewable_type: "Experience", rating: rand(1..5), content: Faker::Religion::Bible.quote })
  end
end

puts "Created #{Review.count} reviews!"
