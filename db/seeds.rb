# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Supplier.destroy_all
Image.destroy_all


Product.create([
  {name: "Shiba dull", price:"49", description: "size: small,height: 15 cm,Original Design,color:red white black", supplier_id: 1},
  {name: "Shiba keychain", price:"39" ,description: "size: small,height: 15 cm,Original Design,color:red white black", supplier_id: 2},
  {name: "Shiba changebag", price:"69" ,description: "size: small,height: 15 cm,Original Design,color:red white black", supplier_id: 1},
  ])

Supplier.create([
  {name:"CangHouse", email:"CangHouse@gmail.com", phone:"800-800-8800"},
  {name:"taobao", email:"supplier@taobao.com", phone:"010-8266-8791"}
  ])

Image.create([
  {url:"http://cdn3-www.dogtime.com/assets/uploads/gallery/shiba-inu-dog-breed-picutres/10-profile.jpg",product_id:"1"},
  {url:"http://cdn3-www.dogtime.com/assets/uploads/gallery/shiba-inu-dog-breed-picutres/10-profile.jpg",product_id:"2"},
  {url:"http://cdn3-www.dogtime.com/assets/uploads/gallery/shiba-inu-dog-breed-picutres/10-profile.jpg",product_id:"3"}
  ])
