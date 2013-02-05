require_relative 'product'
require_relative 'line_item'

p = Product.new(:name => 'The Product', :price => 55)

puts "Basic tax: #{p.basic_tax}"

l = LineItem.new(10, p)
puts "Product Name: #{l.product_name}"
puts "Total price: #{l.total_price_with_taxes}"
