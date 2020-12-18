# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
User.delete_all


5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'locadex1234'
    )
  puts "created new user #{user.email}"

  5.times do
    product = Product.create!(
      title: Faker::Commerce.product_name,
      price: rand(1.0..100.0),
      published: true,
      user_id: user.id
      )
    puts "Created a new product #{product.title} for #{user.id}"
  end
  puts "#{user.id} products are done"
end
puts "All done"
