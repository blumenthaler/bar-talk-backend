# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
alex = User.create(username: "Alex the Bartender", password: "password")
mike = User.create(username: "Mike Q", password: "pw")
jimmy = User.create(username: "JimmyPFromQueens", password: "queens")

# Cocktails
dirty_cocktail = Cocktail.create(name: "Dirty Martini", spirit: "gin")
vodka_dirty = Cocktail.create(name: "Dirty Martini", spirit: "vodka")
old_fashioned_cocktail = Cocktail.create(name: "Old Fashioned", spirit: "rye")

# Recipes
mike_fashioned = Recipe.create(name: old_fashioned_cocktail.name, spirit: old_fashioned_cocktail.spirit, ingredients: "2 oz rye, 0.5 oz simple, 4 dashes angostura", garnish: "cherry", notes: "Can also use Bourbon or Brandy", votes: 0, user: mike, cocktail: old_fashioned_cocktail)

alex_fashioned = Recipe.create(name: old_fashioned_cocktail.name, spirit: old_fashioned_cocktail.spirit, ingredients: "2 oz rye, 0.25 oz simple, 3 dashes angostura", garnish: "orange slice", notes: "My favorite drink, like Don Draper lol", votes: 0, user: alex, cocktail: old_fashioned_cocktail)

jimmy_dirty = Recipe.create(name: vodka_dirty.name, spirit: vodka_dirty.spirit, ingredients: "2 oz vodka, 1 oz olive juice, splash dry vermouth", garnish: "bleu cheese olives", notes: "Grey Goose boi!!", votes: 0, user: jimmy, cocktail: dirty_cocktail)

dirty_recipe = Recipe.create(name: dirty_cocktail.name, spirit: dirty_cocktail.spirit, ingredients: "lots of gin, olive juice, dry vermouth", garnish: "olives", notes: "this is very tasty with Boodles", votes: 0, user: alex, cocktail: dirty_cocktail)

# Comments
dirty_comment = Comment.create(content: "this is delicious", user: mike, recipe: dirty_recipe)
another_comment = Comment.create(content: "I hate goose", user: alex, recipe: jimmy_dirty)
comment_3 = Comment.create(content: "yeah goose is whack haha", user: mike, recipe: jimmy_dirty)
comment_4 = Comment.create(content: "I'd try this with Brandy", user: jimmy, recipe: mike_fashioned)
comment_5 = Comment.create(content: "If you don't like what they're saying, change the conversation ;)", user: mike, recipe: alex_fashioned)