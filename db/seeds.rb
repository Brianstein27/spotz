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
  ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736852817/spotz/oberbaumbruecke-u-bahn_r6icuy.jpg"],
  ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736852956/spotz/caption_drs7x3.jpg"],
  ["https://res.cloudinary.com/djyxemrhk/image/upload/v1736853044/spotz/cafe-am-neuen-see_f2ei1y.jpg"]
]

spots = [
  { name: "Oberbaum Bridge", address: "Warschauer Strasse 43, 10243 Berlin", category: hangout_category, subtitle: "Iconic Spot for Sunsets", description: "The perfect spot to talk and philosophise with your friends about anything in a very relaxed and laid-back atmosphere." },
  { name: "East Side Gallery", address: "Muehlenstrasse 3-100, 10243 Berlin", category: culture_category, subtitle: "Open-Air Gallery", description: "An international memorial for freedom, it consists of a series of murals painted directly on a remnant of the Berlin Wall." },
  { name: "Café am Neuen See", address: "Lichtensteinallee 2, 10787 Berlin", category: foodanddrinks_category,  subtitle: "A lovely beer garden and café", description: "Café am Neuen See, nestled in Berlin's Tiergarten, offers a serene retreat with picturesque lakeside views. This charming café and beer garden features a relaxed atmosphere, perfect for unwinding amidst lush greenery. Guests can enjoy a variety of hearty German dishes and refreshing beverages, making it an ideal spot for both casual dining and leisurely drinks. Boat rentals on the adjacent lake add a touch of adventure, enhancing the overall experience." },
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
  { title: "Drum Lessons", address: "Rudi-Dutschke-Str. 26, 10969 Berlin", date: "2024-06-07" , time: "09:00:00 pm", image_url: "https://res.cloudinary.com/djyxemrhk/image/upload/v1716475887/development/m0tcsipgpb5rpydi8umo7zwnq8iw.jpg" },
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

users =  [
  { email: "brian@brian.de", password: "brianbrian", username: "brianstein27" },
  { email: "emma@emma.com", password: "emmaemma", username: "emma_uloma" },
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
]

Link.create!(links)
puts "Created #{Link.count} links!"
