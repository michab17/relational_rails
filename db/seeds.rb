# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hotel_micha = Hotel.create!(name: "Hotel Micha", vacancy: true, occupancy: 200)
maximus = hotel_micha.guests.create!(name: "Maximus", royalty_member: true, room_number: 123)
jenifer = hotel_micha.guests.create!(name: "Jenifer", royalty_member: true, room_number: 444)

overlook_hotel = Hotel.create!(name: "Overlook Hotel", vacancy: false, occupancy: 400)
fred = overlook_hotel.guests.create!(name: "Fred", royalty_member: false, room_number: 999)

zootopia = Zoo.create!(name: "Zootopia", open: true, num_of_people: 100)
fred = zootopia.animals.create!(name: "Fred", has_covid: false, age: 20)
prometheus = zootopia.animals.create!(name: "Prometheus", has_covid: false, age: 109)

aardvark_ranch = Zoo.create!(name: "Aardvark Ranch", open: false, num_of_people: 0)
elizabeth = aardvark_ranch.animals.create!(name: "Elizabeth", has_covid: true, age: 2)
