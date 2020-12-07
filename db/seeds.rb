# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.destroy_all
Category.destroy_all
Item.destroy_all
 
Customer.create(name: 'Maria', username: "A", password: "A")
Customer.create(name: 'Rouan', username: "B", password: "B")
 

cakes = Category.create(name: 'Cakes')
cookies = Category.create(name: 'Cookies')
cupcakes = Category.create(name: 'Cupcakes')
pies = Category.create(name: 'Pies')
puddings = Category.create(name: 'Puddings')
 
Item.create(name: 'Molten Chocolate Cake', price: 10.0, category: cakes)
Item.create(name: 'Cheesecake', price: 15.0, category: cakes)
Item.create(name: 'Red Velvet Cake', price: 20.0, category: cakes)
Item.create(name: 'Chocolate Chip Cookie', price: 0.25, category: cookies)
Item.create(name: 'Snickerdoodle', price: 0.5, category: cookies)
Item.create(name: 'Fortune Cookie', price: 0.75, category: cookies)
Item.create(name: 'Vanilla Cupcake', price: 2.0, category: cupcakes)
Item.create(name: 'Strawberry Cupcake', price: 2.5, category: cupcakes)
Item.create(name: 'Brownie', price: 3.0, category: cupcakes)
Item.create(name: 'Apple Pie', price: 11.0, category: pies)
Item.create(name: 'Pecan Pie', price: 12.0, category: pies)
Item.create(name: 'Pumpkin Pie', price: 13.0, category: pies)
Item.create(name: 'Butterscotch Pudding', price: 2.0, category: puddings)
Item.create(name: 'Hasty Pudding', price: 3.0, category: puddings)
Item.create(name: 'Tembleque', price: 4.0, category: puddings)

puts 'Done seeding!'
