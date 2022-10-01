# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creando usuario"
User.create(
  first_name: "condorito",
  last_name: "conder",
  email: "condormayor@gmail.com",
  password: "pajarovolador",
  city: "los andes",
  phone_number: "12345672"
)
puts "user creado"

puts "creando Place"
User.create(
  first_name: "condorito",
  last_name: "conder",
  email: "condormayor@gmail.com",
  password: "pajarovolador",
  city: "los andes",
  phone_number: "12345672"
)
puts "Place creado"

puts "creando Reservation"
User.create(
  address: "corrientes 1233",
  city: "BS",
  area: 240.5,
  price: 300,
  user_id: 1,
  phone_number: "12345672"
)
puts "Reservation creado"
