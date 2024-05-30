Review.destroy_all
User.destroy_all
puts "Deleting user/s."

Spot.destroy_all
puts "Deleting location/s."

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

spots = [
  { name: "Brandenburger Tor", address: "Pariser Platz, 10117 Berlin", category: "Culture", subtitle: "Iconic City Gate", description: "A neoclassical monument and one of the best-known landmarks of Germany." },
  { name: "Reichstag Building", address: "Platz der Republik 1, 11011 Berlin", category: "Culture", subtitle: "Parliament Building", description: "The meeting place of the German parliament, known for its historic and modern significance." },
  { name: "Berlin Cathedral", address: "Am Lustgarten, 10178 Berlin", category: "Culture", subtitle: "Evangelical Church", description: "A famous cathedral on Museum Island in the Mitte borough." },
  { name: "Museum Island", address: "Bodestraße 1-3, 10178 Berlin", category: "Culture", subtitle: "Museum Complex", description: "An island in the Spree river housing five world-renowned museums." },
  { name: "Alexanderplatz", address: "Alexanderplatz, 10178 Berlin", category: "Hangout", subtitle: "Historic Square", description: "A large Hangout and transport hub in central Berlin." },
  { name: "Berlin TV Tower", address: "Panoramastraße 1A, 10178 Berlin", category: "Culture", subtitle: "Observation Tower", description: "The tallest structure in Germany, offering panoramic views of Berlin." },
  { name: "East Side Gallery", address: "Mühlenstraße 3-100, 10243 Berlin", category: "Culture", subtitle: "Open-Air Gallery", description: "An international memorial for freedom, it consists of a series of murals painted directly on a remnant of the Berlin Wall." },
  { name: "Checkpoint Charlie", address: "Friedrichstraße 43-45, 10117 Berlin", category: "Culture", subtitle: "Former Border Crossing", description: "The best-known Berlin Wall crossing point between East and West Berlin during the Cold War." },
  { name: "Charlottenburg Palace", address: "Spandauer Damm 10-22, 14059 Berlin", category: "Culture", subtitle: "Former Royal Palace", description: "The largest palace in Berlin and the only surviving royal residence in the city." },
  { name: "Potsdamer Platz", address: "Potsdamer Platz, 10785 Berlin", category: "Hangout", subtitle: "Central Spot", description: "A major public square and traffic intersection in the center of Berlin." },
  { name: "Gendarmenmarkt", address: "Gendarmenmarkt, 10117 Berlin", category: "Hangout", subtitle: "Historic Market Square", description: "One of Berlin's most beautiful squares, featuring the Konzerthaus and French and German Cathedrals." },
  { name: "Berlin Zoological Garden", address: "Hardenbergplatz 8, 10787 Berlin", category: "Hangout", subtitle: "Zoological Garden", description: "The oldest and best-known zoo in Germany." },
  { name: "Kaiser Wilhelm Memorial Church", address: "Breitscheidplatz, 10789 Berlin", category: "Culture", subtitle: "Memorial Church", description: "A Protestant church and a memorial to the Kaiser Wilhelm II." },
  { name: "Hackescher Markt", address: "Hackescher Markt, 10178 Berlin", category: "Hangout", subtitle: "Shopping and Dining Area", description: "A lively area known for its nightlife, restaurants, and shopping." },
  { name: "Berlin Wall Memorial", address: "Bernauer Str. 111, 13355 Berlin", category: "Culture", subtitle: "Memorial Site", description: "A monument to the divided city and the victims of communist tyranny." },
  { name: "Victory Column", address: "Großer Stern, 10557 Berlin", category: "Culture", subtitle: "Triumphal Column", description: "A major tourist attraction in Berlin, offering great views from the top." },
  { name: "Treptower Park", address: "Alt-Treptow, 12435 Berlin", category: "Nature", subtitle: "Hangout Park", description: "A large public park alongside the river Spree." },
  { name: "Kurfürstendamm", address: "Kurfürstendamm, 10719 Berlin", category: "Hangout", subtitle: "Shopping Boulevard", description: "One of the most famous avenues in Berlin, known for its shopping and nightlife." },
  { name: "Tempelhofer Feld", address: "Tempelhofer Damm, 12101 Berlin", category: "Nature", subtitle: "Public Park", description: "A large park created from the former Tempelhof Airport, used for various recreational activities." },
  { name: "Berlin Philharmonie", address: "Herbert-von-Karajan-Straße 1, 10785 Berlin", category: "Culture", subtitle: "Concert Hall", description: "A renowned concert hall home to the Berlin Philharmonic Orchestra." },
  { name: "Berghain", address: "Am Wriezener Bahnhof, 10243 Berlin", category: "Nightlife", subtitle: "Famous Club", description: "One of the most famous techno clubs in the world." },
  { name: "Watergate", address: "Falckensteinstraße 49, 10997 Berlin", category: "Nightlife", subtitle: "Nightclub", description: "A nightclub known for its location on the river Spree and its high-quality electronic music." },
  { name: "Kater Blau", address: "Holzmarktstraße 25, 10243 Berlin", category: "Nightlife", subtitle: "Nightclub", description: "A renowned club known for its eclectic music and unique atmosphere." },
  { name: "Clärchens Ballhaus", address: "Auguststraße 24, 10117 Berlin", category: "Nightlife", subtitle: "Dance Hall and Restaurant", description: "A historic dance hall and restaurant offering a variety of music and dancing styles." },
  { name: "Tresor", address: "Köpenicker Str. 70, 10179 Berlin", category: "Nightlife", subtitle: "Techno Club", description: "A legendary techno club located in a former power plant." },
  { name: "Prater Garten", address: "Kastanienallee 7-9, 10435 Berlin", category: "Food'n'Drinks", subtitle: "Beer Garden", description: "The oldest beer garden in Berlin, offering a variety of beers and traditional German food." },
  { name: "Cookies Cream", address: "Behrenstraße 55, 10117 Berlin", category: "Food'n'Drinks", subtitle: "Vegetarian Restaurant", description: "An upscale vegetarian restaurant with a creative menu." },
  { name: "Zur Letzten Instanz", address: "Waisenstraße 14-16, 10179 Berlin", category: "Food'n'Drinks", subtitle: "Historic Restaurant", description: "Berlin's oldest restaurant, serving traditional German cuisine." },
  { name: "Bar Tausend", address: "Schiffbauerdamm 11, 10117 Berlin", category: "Food'n'Drinks", subtitle: "Cocktail Bar", description: "A stylish bar known for its innovative cocktails and unique atmosphere." },
  { name: "The Barn", address: "Auguststraße 58, 10119 Berlin", category: "Food'n'Drinks", subtitle: "Coffee Shop", description: "A famous coffee shop known for its high-quality coffee and minimalist design." },
  { name: "Restaurant Tim Raue", address: "Rudi-Dutschke-Straße 26, 10969 Berlin", category: "Food'n'Drinks", subtitle: "Fine Dining", description: "A Michelin-starred restaurant offering Asian-inspired cuisine by Chef Tim Raue." },
  { name: "Katz Orange", address: "Bergstraße 22, 10115 Berlin", category: "Food'n'Drinks", subtitle: "Modern European", description: "A restaurant known for its cozy atmosphere and modern European dishes." },
  { name: "Facil", address: "Potsdamer Straße 3, 10785 Berlin", category: "Food'n'Drinks", subtitle: "Gourmet Restaurant", description: "A Michelin-starred restaurant offering innovative, high-end cuisine." },
  { name: "Grill Royal", address: "Friedrichstraße 105b, 10117 Berlin", category: "Food'n'Drinks", subtitle: "Steakhouse", description: "A chic steakhouse known for its high-quality meats and celebrity clientele." },
  { name: "Nobelhart & Schmutzig", address: "Friedrichstraße 218, 10969 Berlin", category: "Food'n'Drinks", subtitle: "Contemporary German", description: "A restaurant focusing on locally sourced ingredients and contemporary German cuisine." },
  { name: "Spielplatz", address: "Marion-Gräfin-Dönhoff-Platz, 10117 Berlin", category: "Playground", subtitle: "Playground in Berlin Mitte", description: "Great playground for kids." }
]

puts "Creating location/s."
spots.each do |spot|
  Spot.create!(spot)
end

puts "Created #{Spot.count} location/s."

puts "Creating user/s."

users =  [ { email: "user@user.com", password: "123456", username: "user1" } ]

users.each do |user|
  User.create!(user)
end

puts "Created #{User.count} user."
