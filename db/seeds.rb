# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Menu.create!(
  name: "席のみ",
  price: '0',
)

Menu.create!(
  name: "Aコース",
  price: '3000',
)

Menu.create!(
  name: "Bコース",
  price: '4500',
)

Menu.create!(
  name: "Cコース",
  price: '6000',
)

AdminUser.create!(
  email: "admin@example.com",
  password: "password"
)


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?