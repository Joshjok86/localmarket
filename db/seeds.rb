puts "Cleaning database..."

Product.destroy_all
Message.destroy_all
Chatroom.destroy_all
Seller.destroy_all
User.destroy_all

puts "All done, nice and clean :) now seeding..."

user = User.create!(email: "seed@seed.com", password: "123456", firstname: "Ben", lastname: "Farmer", username: "farmerben", address: "123 my home")

puts "new user created"

seller = Seller.create!(user_id: user.id, description: "I sell fresh produce!", seller_name: "Ben's Farm", email: "bens@farm.com", phone_number: "1234567890", address: "Ben's Farm")

puts "new seller account created"

product = Product.create!(seller_id: seller.id, product_name: "eggs", description: "Fresh eggs from my own hens", price: 10.99, quantity: 100)

puts "new product created"
puts "Seeding finished :)"
