# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.delete_all
Player.delete_all
User.delete_all

equipos = []
5.times do |j|
  equipos << Team.create(nombre: Faker::Team.name, pais: "Chile")
end

paises = ISO3166::Country.find_all_countries_by_region('Americas')
equipos.each do |equipo|
  20.times do |numero|
    Player.create(nombre: Faker::Name.first_name, apellido: Faker::Name.last_name,
    pais: paises[rand(paises.length)].ioc, edad: 15 + rand(20), team_id: equipo.id)
  end
end

10.times do |u|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, password: Faker::Internet.password(6))
end
