# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(category_name: "Entertainment")
Category.create(category_name: "Food")
Category.create(category_name: "Creative")
Category.create(category_name: "Spiritual/Mental")
Category.create(category_name: "Other")
Category.create(category_name: "Social")
Category.create(category_name: "Service")
Category.create(category_name: "Exercise")
Category.create(category_name: "Travel")