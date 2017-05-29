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
Tournament.delete_all

my_user = User.create!(first_name: "Isaac", last_name: "Carrera",
email: "isfecave@gmail.com", password: "asdasd")

usuarios = []
usuarios << my_user
10.times do |u|
  usuarios << User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  email: Faker::Internet.email, password: Faker::Internet.password(6))
end

equipos = []

50.times do |j|
  equipos << Team.create!(nombre: Faker::Team.unique.name, pais: "Chile", user_id: usuarios.sample.id)
end

paises = ISO3166::Country.find_all_countries_by_region('Americas')
equipos.each do |equipo|
  20.times do |numero|
    Player.create!(nombre: Faker::Name.first_name, apellido: Faker::Name.last_name,
    pais: "Chile", edad: 15 + rand(20), team_id: equipo.id)
  end
end
