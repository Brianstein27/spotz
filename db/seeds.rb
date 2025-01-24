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
                subtitle: "Open-Air Gallery", description: "An international memorial for freedom, it consists of a series of murals painted directly on a remnant of the Berlin Wall." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736852956/spotz/caption_drs7x3.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668562/spotz/east-side-gallery_asaggo.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668561/spotz/EastSideGallery-Berlin_201505DSC_0489_qdmyu1.jpg"]
  },
  {
    details: {  name: "Café am Neuen See", address: "Lichtensteinallee 2, 10787 Berlin", category: foodanddrinks_category,
                subtitle: "A lovely beer garden and café", description: "Café am Neuen See, nestled in Berlin's Tiergarten, offers a serene retreat with picturesque lakeside views. This charming café and beer garden features a relaxed atmosphere, perfect for unwinding amidst lush greenery. Guests can enjoy a variety of hearty German dishes and refreshing beverages, making it an ideal spot for both casual dining and leisurely drinks. Boat rentals on the adjacent lake add a touch of adventure, enhancing the overall experience." }, 
    images: ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736853044/spotz/cafe-am-neuen-see_f2ei1y.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668762/spotz/066e307e-3deb-4fe0-b88d-c10d783d9824_iasyab.jpg", "https://res.cloudinary.com/djyxemrhk/image/upload/v1737668761/spotz/20200725_1232026757749722307559891-2048x1152_k9kmwp.jpg"]
  }
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

3.times do
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
