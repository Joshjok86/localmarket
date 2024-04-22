puts "Cleaning database..."

Product.destroy_all
Message.destroy_all
Chatroom.destroy_all
Seller.destroy_all
User.destroy_all

puts "All done, nice and clean :) now seeding..."

user = User.create!(email: "seed@seed.com", password: "123456", firstname: "Ben", lastname: "Farmer", username: "farmerben", address: "123 my home")

seller = Seller.create!(user_id: user.id, description: "I sell fresh produce!", seller_name: "Ben's Farm", email: "bens@farm.com", phone_number: "1234567890", address: "Werderstr.13, 90489 Nuernberg")

product = Product.create!(seller_id: seller.id, product_name: "eggs", description: "Fresh eggs from my own hens", price: 10.99, quantity: 100)

user2 = User.create!(email: "carrot@carrot.com", password: "123456", firstname: "Carrie", lastname: "Carrot", username: "carriecarrot", address: "456 my home")

seller2 = Seller.create!(user_id: user2.id, description: "I sell Carrots", seller_name: "Carrot Farm", email: "Carrot@farm.com", phone_number: "1234567890", address: "Carrot Farm", website: "www.carrotfarm.com")

product2 = Product.create!(seller_id: seller2.id, product_name: "carrots", description: "Fresh carrots from my own farm", price: 5.99, quantity: 100)

user3 = User.create!(email: "marketplace@admin.com", password: "123456", firstname: "Marketplace", lastname: "Admin", username: "marketplaceadmin", address: "123 marketplace")

puts "new user created"
puts "new seller account created"
puts "new product created"
puts "Seeding finished :)"
