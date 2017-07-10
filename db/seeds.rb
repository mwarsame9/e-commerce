Product.destroy_all

25.times do |index|
  Product.create!(name: Faker::Commerce.product_name,
                  price: Faker::Commerce.price)
end

p "Created #{Product.count} products"
