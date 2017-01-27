# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

Product.create([
  {name: "Shiba dull", price:"49" , image: "dull.jpg", description: "size: small,height: 15 cm,Original Design,color:red white black"},
  {name: "Shiba keychain", price:"39" , image: "keychain.jpg", description: "size: small,height: 15 cm,Original Design,color:red white black"},
  {name: "Shiba changebag", price:"69" , image: "changebag.jpg", description: "size: small,height: 15 cm,Original Design,color:red white black"},
  ])
