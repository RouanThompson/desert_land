# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.destroy_all
# Category.destroy_all
# Item.destroy_all
# Order.destroy_all
 
Customer.create(name: 'Maria', username: "A", password: "A")
Customer.create(name: 'Rouan', username: "B", password: "B")
