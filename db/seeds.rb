# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alex = User.create(username: "Alex the Bartender", password: "password")



dirty = Recipe.create(name: "Dirty Martini", spirit: "gin", ingredients: "lots of gin, olive juice, dry vermouth", garnish: "olives", notes: "this is very tasty with Boodles", user: alex)

dirty_comment = Comment.create(content: "this is delicious", user: alex, recipe: dirty)