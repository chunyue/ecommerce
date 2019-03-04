namespace :dev do 
  task fake: :environment do
    Product.destroy_all

    1000.times do |i|
      Product.create!(name: FFaker::Product.product_name,
        description: FFaker::Lorem.paragraph,
        price: FFaker::Random.rand(max = 5000),
        image: File.open(Rails.root.join("public/uploads/product/image/0#{rand(1..7)}.jpg"))
      )
    end
    puts "have created fake products"
    puts "now you have #{Product.count} products data"
  end  
end