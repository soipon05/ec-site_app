# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |t|
  Product.create(
    name: Faker::Commerce.product_name,
    price: (Faker::Commerce.price.round(-1))*100,
    description: Faker::Lorem.paragraph,
    selllimit: 10,
    status: 1
  )
end