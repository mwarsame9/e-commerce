Product.destroy_all
Review.destroy_all

25.times do |index|
  product = Product.create!(name: Faker::Commerce.product_name,
                            price: Faker::Commerce.price)

    rand(2..5).times do |i|
      review = product.reviews.create!(author: Faker::TwinPeaks.character,
                                      content: Faker::Hipster.sentence(3))

    end

end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
